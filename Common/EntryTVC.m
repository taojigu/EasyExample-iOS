//
//  EntryTVC.m
//  Runtime
//
//  Created by gus on 15/10/26.
//  Copyright © 2015年 gujitao. All rights reserved.
//

#import "EntryTVC.h"

@interface EntryTVC ()
{
    
}

@property(nonatomic,strong)NSMutableArray*titleArray;
@property(nonatomic,strong)NSMutableArray* invocationArray;

@end

@implementation EntryTVC

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    [self privateInit];
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}
-(void)privateInit
{
    self.titleArray = [[NSMutableArray alloc]init];
    self.invocationArray = [[NSMutableArray alloc]init];
    return;
}

-(void)insertTitleAndInvocation:(NSString*)title invocation:(NSInvocation*)invocation
{
    NSAssert(title.length>0, @"Title should not be nil");
    [self.titleArray addObject: title];
    [self.invocationArray addObject:invocation];
    return;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifer = @"CellIdentifer";
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
    }
    NSString* title = [self.titleArray objectAtIndexedSubscript:indexPath.row];
    cell.textLabel.text = title;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInvocation* invk = [self.invocationArray objectAtIndex:indexPath.row];
    [invk invoke];
}



@end
