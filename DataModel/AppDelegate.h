//
//  AppDelegate.h
//  DataModel
//
//  Created by Travis Delly on 7/6/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "HTTPHelper.h"
#import "HomePage.h"
#import "Company.h"
#import "CustomGUI.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>


//NSDATAMODEL
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

-(void)getUserStocklist;
-(void)deleteAllObjects:(NSString*)model;
-(void)saveUserStocklist:(Company*)companyToSave;


//Helpers etc. Delegate things
@property CustomGUI *customGUI;
@property NSMutableArray *userWatchList;
@property HTTPHelper *helper;
@property (strong, nonatomic) UIWindow *window;
@property UINavigationController *navController;
@property HomePage *rootView;



//Will be deleting soon.
@property NSMutableArray* topTen;
@property NSMutableArray* topTenNames;


@end

