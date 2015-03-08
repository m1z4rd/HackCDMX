//
//  Mapas.m
//  HACK CDMX
//
//  Created by David Sinai Jiménez Jiménz on 07/03/15.
//  Copyright (c) 2015 David Sinai Jiménez Jiménez. All rights reserved.
//

#import "Mapas.h"

#import "JSON_Locales.h"
#import "SearchVC.h"
#import "AnimationHelper.h"
#import "UserDefaultsHelper.h"

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)


@interface Mapas ()
{
    NSMutableArray *Puntos;
    NSMutableArray *elements;
}
@end

@implementation Mapas 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Ubicaciones";
    
    // Do any additional setup after loading the view.
    
    /* Set the map type to Standard */
    self.myMapView.mapType = MKMapTypeStandard;
    
    self.myMapView.autoresizingMask =
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
    
    

    self.myMapView.delegate = self;
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = (id)self;
    
#ifdef __IPHONE_8_0
    if(IS_OS_8_OR_LATER) {
        // Use one or the other, not both. Depending on what you put in info.plist
        [self.locationManager requestWhenInUseAuthorization];
        [self.locationManager requestAlwaysAuthorization];
    }
#endif
    [self.locationManager startUpdatingLocation];

    
    self.myMapView.showsUserLocation = YES;
    [self.myMapView setMapType:MKMapTypeStandard];
    [self.myMapView setZoomEnabled:YES];
    [self.myMapView setScrollEnabled:YES];
    
    [UserDefaultsHelper setString:@"" key:@"catID"];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    [self.locationManager startUpdatingLocation];
    
    if (self.myMapView.annotations)
        [self.myMapView removeAnnotations:self.myMapView.annotations];
    
    [self getData];
    [self viewArea];
  
}

-(void)viewArea
{
    //View Area
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = self.locationManager.location.coordinate.latitude;
    region.center.longitude = self.locationManager.location.coordinate.longitude;
    region.span.longitudeDelta = 0.9f;
    region.span.longitudeDelta = 0.9f;
    [self.myMapView setRegion:region animated:YES];
}

-(void)getData
{
    Puntos = [[JSON_Locales CentrosDeSalud] mutableCopy];
    NSMutableDictionary *mutableDict = [[NSMutableDictionary alloc]init];
    elements = [[NSMutableArray alloc]init];
//        NSLog(@"%@",Puntos);
    
    
    for (int i = 0; i < [Puntos count]; i++)
    {
        if (![[UserDefaultsHelper getString:@"catID"] isEqualToString:@""])
        {
            NSString *numero  = [NSString stringWithFormat:@"%@",[[Puntos objectAtIndex:i]objectForKey:@"NUMERO"]];
            if ([[UserDefaultsHelper getString:@"catID"] isEqualToString: numero])
            {
                CLLocationCoordinate2D location;
                location.latitude = [[[Puntos objectAtIndex:i]objectForKey:@"LONGITUD"] floatValue];
                location.longitude = [[[Puntos objectAtIndex:i]objectForKey:@"LATITUD"] floatValue];
                
                MyAnnotation *annotation =  [[MyAnnotation alloc]
                                             initWithCoordinates:location
                                             title:[[Puntos objectAtIndex:i]objectForKey:@"NOMBRE_CENTRO"]
                                             subTitle:[[Puntos objectAtIndex:i]objectForKey:@"DOMICILIO"]];
                annotation.pinNum = [[Puntos objectAtIndex:i]objectForKey:@"NUMERO"];
                
                [self.myMapView addAnnotation:annotation];
            }
        }else
        {
            [mutableDict setDictionary:[Puntos objectAtIndex:i]];
            CLLocationCoordinate2D location;
            location.latitude = [[[Puntos objectAtIndex:i]objectForKey:@"LONGITUD"] floatValue];
            location.longitude = [[[Puntos objectAtIndex:i]objectForKey:@"LATITUD"] floatValue];
            
            MyAnnotation *annotation =  [[MyAnnotation alloc]
                                         initWithCoordinates:location
                                         title:[[Puntos objectAtIndex:i]objectForKey:@"NOMBRE_CENTRO"]
                                         subTitle:[[Puntos objectAtIndex:i]objectForKey:@"DOMICILIO"]];
            annotation.pinNum = [[Puntos objectAtIndex:i]objectForKey:@"NUMERO"];
            
            [self.myMapView addAnnotation:annotation];
        }
        
        [elements addObject: [NSString stringWithFormat:@"%@¬%@¬%@¬%@¬%@¬%@¬%@",
                              [[Puntos objectAtIndex:i]objectForKey:@"NOMBRE_CENTRO"],
                              [[Puntos objectAtIndex:i]objectForKey:@"NUMERO"],
                              [[Puntos objectAtIndex:i]objectForKey:@"TIPO"],
                              [[Puntos objectAtIndex:i]objectForKey:@"NOMBRE_LOCALIDAD"],
                              [[Puntos objectAtIndex:i]objectForKey:@"NOMBRE_ESTADO"],
                              [[Puntos objectAtIndex:i]objectForKey:@"SUB-TIPO"],
                              [[Puntos objectAtIndex:i]objectForKey:@"NOMBRE_MUNICPIO"]]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation{
    
    MKAnnotationView *result = nil;
    
    if ([annotation isKindOfClass:[MyAnnotation class]] == NO){
        return result;
    }
    
    if ([mapView isEqual:self.myMapView] == NO){
        /* We want to process this event only for the Map View
         that we have created previously */
        return result;
    }
    
    /* First typecast the annotation for which the Map View has
     fired this delegate message */
    MyAnnotation *senderAnnotation = (MyAnnotation *)annotation;
    
    /* Using the class method we have defined in our custom
     annotation class, we will attempt to get a reusable
     identifier for the pin we are about to create */
    NSString *pinReusableIdentifier =
    [MyAnnotation
     reusableIdentifierforPinColor:0];//senderAnnotation.pinColor];
    
    /* Using the identifier we retrieved above, we will
     attempt to reuse a pin in the sender Map View */
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)
    [mapView
     dequeueReusableAnnotationViewWithIdentifier:
     pinReusableIdentifier];
    
    if (annotationView == nil){
        /* If we fail to reuse a pin, then we will create one */
        annotationView =
        [[MKPinAnnotationView alloc] initWithAnnotation:senderAnnotation
                                        reuseIdentifier:pinReusableIdentifier];
        
        /* Make sure we can see the callouts on top of
         each pin in case we have assigned title and/or
         subtitle to each pin */
        annotationView.canShowCallout = YES;
        
    }
    
    UIImage *pinImage = [self burnTextIntoImage:[NSString stringWithFormat:@"%@",senderAnnotation.pinNum] Img:[UIImage imageNamed:@"pinGreen"]];
    if (pinImage != nil){
        annotationView.image = pinImage;
    }
    
    result = annotationView;
    
    return result;
}

#pragma mark - Imagen + Texto

- (UIImage*)burnTextIntoImage:(NSString*)text Img:(UIImage*)img
{
    
    UIGraphicsBeginImageContext(img.size);
    
    CGRect aRectangle = CGRectMake(0, 0, img.size.width, img.size.height);
    CGRect tRectangle = CGRectMake(0, 5, img.size.width, img.size.height);
    [img drawInRect:aRectangle];
    
    NSInteger fontSize = 14;
    UIFont *font = [UIFont boldSystemFontOfSize: fontSize];     // set text font
    
    /// Make a copy of the default paragraph style
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    /// Set line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    /// Set text alignment
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: font,
                                  NSParagraphStyleAttributeName: paragraphStyle,
                                  NSForegroundColorAttributeName:[UIColor whiteColor] };
    
    [text drawInRect:tRectangle withAttributes:attributes];
    
    UIImage *theImage=UIGraphicsGetImageFromCurrentImageContext();   // extract the image
    UIGraphicsEndImageContext();     // clean  up the context.
    return theImage;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)aView
{
    for (int i = 0; i < Puntos.count; i++)
    {
        if ([[[Puntos objectAtIndex:i]objectForKey:@"DOMICILIO"] isEqualToString:aView.annotation.subtitle])
        {
            [AnimationHelper changeViewSize:vc_detail withFrame:CGRectMake(0, 134, self.view.frame.size.width, 370) withDuration:1 andWait:0];
            
            lb_horario.text = [[Puntos objectAtIndex:i]objectForKey:@"HORARIO"];
            lb_numero.text = [[Puntos objectAtIndex:i]objectForKey:@"NUMERO"];
            lb_tipo.text = [[Puntos objectAtIndex:i]objectForKey:@"TIPO"];
            lb_sub_tipo.text = [[Puntos objectAtIndex:i]objectForKey:@"SUB-TIPO"];
            lb_nombre.text = [[Puntos objectAtIndex:i]objectForKey:@"NOMBRE_CENTRO"];
            lb_localidad.text = [[Puntos objectAtIndex:i]objectForKey:@"NOMBRE_LOCALIDAD"];
            lb_estado.text = [[Puntos objectAtIndex:i]objectForKey:@"NOMBRE_ESTADO"];
            lb_telefono.text = [[Puntos objectAtIndex:i]objectForKey:@"TELEFONO"];
            txv_direccion.text = [[Puntos objectAtIndex:i]objectForKey:@"DOMICILIO"];
        }
    }
}

-(IBAction)search:(id)sender
{
    SearchVC *vc = [[SearchVC alloc] initWithNibName:@"SearchVC" bundle:nil];
    vc.titulo = @"Canal";
    [elements sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    vc.arrElements = elements;
//    vc.txtReference = @"YES";
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

-(IBAction)hidenDetail:(id)sender
{
    [AnimationHelper changeViewSize:vc_detail withFrame:CGRectMake(0, 510, self.view.frame.size.width, 370) withDuration:1 andWait:0];
}

-(IBAction)pushToCall:(id)sender
{
    
}

-(IBAction)getNearPoints:(id)sender
{
    MyAnnotation *annotationMasCercano;
    
    float masCercano = 0;
    int cercano = 0;
    
    if (self.myMapView.annotations)
        [self.myMapView removeAnnotations:self.myMapView.annotations];
    
   
    
    NSInteger i = [sender tag];
    
    switch (i) {
        case 0:
            [self getData];
            cercano = -1;
            break;
        case 1:
            cercano = 0;
            break;
        case 2:
            cercano = 1;
            break;
            
        default:
            break;
    }
   
    
    CLLocationCoordinate2D centre1;
    centre1.latitude = self.locationManager.location.coordinate.latitude;
    centre1.longitude = self.locationManager.location.coordinate.longitude;
    
    for (int i = 0; i < [Puntos count]; i++)
    {
        CLLocationCoordinate2D centre;
        centre.latitude =[[[Puntos objectAtIndex:i]objectForKey:@"LONGITUD"] floatValue];
        centre.longitude = [[[Puntos objectAtIndex:i]objectForKey:@"LATITUD"] floatValue];
        CLLocation *location1 = [[CLLocation alloc] initWithLatitude:centre1.latitude longitude:centre1.longitude];
        CLLocation *location2 = [[CLLocation alloc] initWithLatitude:centre.latitude longitude:centre.longitude];
        
        if (cercano == 1) {
            if (masCercano == 0 || masCercano > [location1 distanceFromLocation:location2]) {
                masCercano = [location1 distanceFromLocation:location2];
        
                CLLocationCoordinate2D location;
                location.latitude = [[[Puntos objectAtIndex:i]objectForKey:@"LONGITUD"] floatValue];
                location.longitude = [[[Puntos objectAtIndex:i]objectForKey:@"LATITUD"] floatValue];
                
                annotationMasCercano =  [[MyAnnotation alloc]
                                             initWithCoordinates:location
                                             title:[[Puntos objectAtIndex:i]objectForKey:@"NOMBRE_CENTRO"]
                                             subTitle:[[Puntos objectAtIndex:i]objectForKey:@"DOMICILIO"]];
                annotationMasCercano.pinNum = [[Puntos objectAtIndex:i]objectForKey:@"NUMERO"];

            }
        }else if (cercano == 0)
        {
            if ([location1 distanceFromLocation:location2] <= 5000){
                //            NSLog(@"Distance in meters: %f", [location1 distanceFromLocation:location2]);
                
                [elements addObject: [NSString stringWithFormat:@"%@",[[Puntos objectAtIndex:i]objectForKey:@"NOMBRE_CENTRO"]]];
                CLLocationCoordinate2D location;
                location.latitude = [[[Puntos objectAtIndex:i]objectForKey:@"LONGITUD"] floatValue];
                location.longitude = [[[Puntos objectAtIndex:i]objectForKey:@"LATITUD"] floatValue];
                
                MyAnnotation *annotation =  [[MyAnnotation alloc]
                                             initWithCoordinates:location
                                             title:[[Puntos objectAtIndex:i]objectForKey:@"NOMBRE_CENTRO"]
                                             subTitle:[[Puntos objectAtIndex:i]objectForKey:@"DOMICILIO"]];
                annotation.pinNum = [[Puntos objectAtIndex:i]objectForKey:@"NUMERO"];
                
                [self.myMapView addAnnotation:annotation];
            }
        }
    }
    
    if (cercano) {
        [self.myMapView addAnnotation:annotationMasCercano];
    }
    
    [self viewArea];
}

@end
