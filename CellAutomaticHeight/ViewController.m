//
//  ViewController.m
//  CellAutomaticHeight
//
//  Created by lc on 2018/7/4.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "ViewController.h"
#import "CommentTableViewCell.h"
#import "Masonry.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray<NSString *> *objects;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"currentMode1 = %@", [NSRunLoop currentRunLoop].currentMode);
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.backgroundColor = [UIColor greenColor];
//    button.frame = CGRectMake(100, 100, 100, 50);
//    [button addTarget:self action:@selector(sss:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
//
//    return;
    
    self.objects = @[@"美商务部对中兴通讯暂时部分解禁，中兴新掌门李自学：尽快恢复生产",
                     @"公告称：从公告发布之日起至8月1日，在有限条件下解除对中兴通讯公司的出口禁令。美国商务部公共事务总监丽贝卡·格洛弗在接受CGTN记者问询时表示，对中兴通讯的7年禁售令并未正式取消。",
                     @"这份公告的授权对象是已经与中兴通讯开展业务的公司，期限是一个月。这些公司销售给中兴通讯的产品必须用于以下方面。第一是支持现有网络和设备的持续运行，其次是支持现有的手机，第三是用于网络安全研究和漏洞披露，另外还有一个条件是交易资金必须在美国商务部授权的机构间转移。",
                     @"在6月29日上午举行的中兴通讯股东大会上，中兴新掌门人李自学发言时强调：“我们的任务还是提振整个公司的信心，包括公司的员工（信心），在拒绝令解除之后，尽快恢复生产，在这之后再做一些工作。”",
                     @"美国芯片巨头美光部分产品在华遭禁售",
                     @"7 月 3 日福州中级法院裁定对美国芯片巨头美光（Micron）发出“诉中禁令”，美国部分闪存 SSD 和内存条 DRAM 将暂时遭禁止在中国销售，虽不是最终判决，但似乎暗示美光确实有侵权之嫌。",
                     @"美光方面周二表示，尚未收到竞争对手台联电早些时候提到的在中国大陆销售芯片的临时禁令。美光表示，在评估来自福州中级人民法院的文件之前，该公司不会对此置评",
                     @"小米或成史上最快纳入恒生指数的港股，一手中签率100%",
                     @"自小米宣布IPO以来，这家超级独角兽就在不停地创造纪录。",
                     @"先是将成首家同股不同权的港股上市公司;招股书又披露在全球营收超千亿且盈利的互联网公司中，小米增速排名第一;认购结束后，小米录得近10倍超购，打破2011年以来大盘股认购倍数纪录，成为全球最大散户规模的IPO，是香港有史以来规模最大的民营公司IPO，全球第三的科技公司IPO",
                     @"业内人士表示，小米上市后或将在10个交易日后被纳入恒生综合指数，创下港股史上最快纪录",
                     @"此外，香港信报消息显示援引市场消息显示，小米一手中签率100%，逾2.5万人申请一手；至于获分派2手有1.5万人，认购9手稳获2手。至于B组的大户方面，最大一张飞为认购1000万股，获分97.2万股，即4860手。小米将于7月9日挂牌"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    tableView.delegate = self;
    tableView.dataSource = self;
    // 步骤1：
    tableView.rowHeight = UITableViewAutomaticDimension;
    // 步骤2：
    tableView.estimatedRowHeight = 100.0;
    [self.view addSubview:tableView];

    if (@available(iOS 11.0, *)) {
        // https://www.jianshu.com/p/b616bea9da88
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
    }
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"currentMode2 = %@", [NSRunLoop currentRunLoop].currentMode);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"CellID";
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[CommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.contentLabel.text = self.objects[indexPath.row];
    
    return cell;
}

- (void)sss:(id)sender {
    NSLog(@"sssss");
}

@end
