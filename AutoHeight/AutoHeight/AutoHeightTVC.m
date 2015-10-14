//
//  AutoHeightTVC.m
//  AutoHeight
//
//  Created by gus on 15/10/13.
//  Copyright © 2015年 CGMG. All rights reserved.
//

#import "AutoHeightTVC.h"

#import "AutoHeightCell.h"
#import "UITableViewController+KYSelfSizingPushFix.h"

@interface AutoHeightTVC ()

@end

@implementation AutoHeightTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.estimatedRowHeight = 64;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self ky_tableViewReloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 17;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   AutoHeightCell* cell = (AutoHeightCell*)[tableView dequeueReusableCellWithIdentifier:@"AutoHeightCell" forIndexPath:indexPath];

    NSMutableString*longText = [[NSMutableString alloc]init];
    for (NSInteger rowIndex=0; rowIndex<=indexPath.row; rowIndex++)
    {
        [longText appendString:@"哎！老斩也有苦衷"];
    }
    cell.longTextLabel.text = longText;
    // Configure the cell...
    
    if (![self ky_isEstimatedRowHeightInCache:indexPath]) {
        CGSize cellSize = [cell systemLayoutSizeFittingSize:CGSizeMake(self.view.frame.size.width, 0) withHorizontalFittingPriority:1000.0 verticalFittingPriority:1000.0];
        [self ky_putEstimatedCellHeightToCache:indexPath height:cellSize.height];
    }
    
    
    return cell;
}

//给estimatedHeight返回缓存的之前正确的高度。return the height cache to the estimatedHeight
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return [self ky_getEstimatedCellHeightFromCache:indexPath defaultHeight:44.0];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
