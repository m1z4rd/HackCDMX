//
//  Mapas.h
//  HACK CDMX
//
//  Created by David Sinai Jiménez Jiménz on 07/03/15.
//  Copyright (c) 2015 David Sinai Jiménez Jiménez. All rights reserved.
//

#import "ViewController.h"

#import "MyAnnotation.h"
#import <MapKit/MapKit.h>

@interface Mapas : ViewController <MKMapViewDelegate>
{
    
    IBOutlet UILabel *lb_horario;
    IBOutlet UILabel *lb_numero;
    IBOutlet UILabel *lb_tipo;
    IBOutlet UILabel *lb_sub_tipo;
    IBOutlet UILabel *lb_nombre;
    IBOutlet UILabel *lb_localidad;
    IBOutlet UILabel *lb_estado;
    IBOutlet UILabel *lb_telefono;
    
    IBOutlet UITextView *txv_direccion;
    
    IBOutlet UIView *vc_detail;
}

@property (strong, nonatomic) IBOutlet MKMapView *myMapView;

@property(strong, nonatomic) CLLocation *location;
@property(nonatomic, retain) CLLocationManager *locationManager;


@end
