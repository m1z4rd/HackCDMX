//
//  SearchVC.m
//  formularios
//
//  Created by TVA on 23/06/14.
//  Copyright (c) 2014 TVA. All rights reserved.
//

#import "SearchVC.h"
#import "UserDefaultsHelper.h"

@interface SearchVC ()

@end

@implementation SearchVC

#pragma mark - Actions

-(IBAction)touchCancelar:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - ViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navItem.title = self.titulo;
    self.btnBack.title = @"Cancelar";
    
    self.arrSearch = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableView

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = @"";
    NSString *textID = @"";
    if (tableView == self.myTable) {
        NSString *myString = [self.arrElements objectAtIndex:indexPath.row];
        
        if ([myString containsString:@"¬"]) {
            NSArray *myArray = [myString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"¬"]];
            text = myArray[0];
            textID = myArray[1];
        }else
            text = myString;
    }
    else{
         NSString *myString = [self.arrSearch objectAtIndex:indexPath.row];
        if ([myString containsString:@"¬"]) {
            NSArray *myArray = [myString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"¬"]];
            text = myArray[0];
            textID = myArray[1];
        }else
            text = myString;
    }
    
    [UserDefaultsHelper setString:textID key:@"catID"];
    self.txtReference.text = text;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    
    if (tableView == self.myTable) {
        rows = self.arrElements.count;
    }
    if(tableView == self.searchDisplayController.searchResultsTableView){
        rows = self.arrSearch.count;
    }
    
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *text = @"";
    if (tableView == self.myTable) {
        NSString *myString = [self.arrElements objectAtIndex:indexPath.row];
        
        if ([myString containsString:@"¬"]) {
            NSArray *myArray = [myString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"¬"]];
            text = myArray[0];
        }else
            text = myString;
    }
    else{
        NSString *myString = [self.arrSearch objectAtIndex:indexPath.row];
        if ([myString containsString:@"¬"]) {
            NSArray *myArray = [myString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"¬"]];
            text = myArray[0];
        }else
            text = myString;
    }
    
    cell.textLabel.text = text;
    
    return cell;
}

#pragma mark - searchDisplayControllerDelegate

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self.arrSearch removeAllObjects];
    
    for (NSString *str in self.arrElements) {
        NSRange range = [str rangeOfString:searchString options:NSCaseInsensitiveSearch];
            
        if (range.length) {
            [self.arrSearch addObject:str];
        }
    }
    
    return YES;
}

@end
