//
//  SearchVC.h
//  formularios
//
//  Created by TVA on 23/06/14.
//  Copyright (c) 2014 TVA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchVC : UIViewController<UISearchBarDelegate, UISearchDisplayDelegate>

@property(nonatomic, strong) NSString *titulo;
@property(nonatomic, strong) IBOutlet UINavigationItem *navItem;
@property(nonatomic, strong) IBOutlet UIBarButtonItem *btnBack;
@property(nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property(nonatomic, strong) IBOutlet UITableView *myTable;
@property(nonatomic, strong) NSMutableArray *arrSearch;
@property(nonatomic, strong) NSArray *arrElements;
@property(nonatomic, strong) IBOutlet UITextField *txtReference;

@end
