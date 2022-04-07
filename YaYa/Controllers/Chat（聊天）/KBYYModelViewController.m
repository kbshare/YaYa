//
//  KBYYModelViewController.m
//  YaYa
//
//  Created by a58 on 2022/3/29.
//  Copyright © 2022 zyw. All rights reserved.
//

#import "KBYYModelViewController.h"
#import <YYModel/YYModel.h>

@interface MobilePhone : NSObject
@property (nonatomic, assign) NSInteger phoneNumber;
@end

@interface College : NSObject
@property (nonatomic, copy) NSString *name;
@end
       

@interface Graduated : NSObject <YYModel>
@property (nonatomic, copy) NSString *name; //名字
@property (nonatomic, assign) NSInteger age; //年龄
@property (nonatomic, assign) NSInteger bigAge; //年龄
@end


//Student
@interface Student : NSObject <YYModel>
@property (nonatomic, copy) NSString *name; //名字
@property (nonatomic, assign) NSInteger age; //年龄
@property (nonatomic, assign) NSInteger bigAge; //年龄
@property (nonatomic, strong) NSArray *mobilePhones; //MobilePhone对象数组
@property (nonatomic, strong) College *college; //学校
@property (nonatomic, copy) NSString *speciallyIvr;
@property (nonatomic, copy) NSString *afterTramSetValue;

@end


@implementation College
@end

@implementation MobilePhone
@end

@implementation Graduated
@end

@implementation Student

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    
    return  @{
        @"bigAge":@"BIGAGE.num" //重新关联映射关系,  bigAge属性, 取BIGAGE中的mum的值
    };
}

//model 中存在其他模型数组, 此方法指定数组中的模型类型, 自动进行转化
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{
        @"mobilePhones":[MobilePhone class],
    };
}

+ (Class)modelCustomClassForDictionary:(NSDictionary*)dictionary {
    if ([dictionary[@"name"] isEqualToString:@"Graduated"]) {
      return [Graduated class];
      } else {
      return [self class];
      }
}

//方法作用于根据JSON创建Model对象之前，该方法可以对生成的Model做一些处理。
- (NSDictionary *)modelCustomWillTransformFromDictionary:(NSDictionary *)dic{
    
    NSMutableDictionary *dictM = [dic mutableCopy];
    if ([dic.allKeys containsObject:@"speciallyIvr"]) {
        dictM[@"speciallyIvr"] = [NSString stringWithFormat:@"%@===new",dic[@"speciallyIvr"]];
    }
    return dictM;
}

//方法作用于根据JSON创建Model对象之后，该方法可以对生成的Model做一些处理。
- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic{
    if (dic[@"speciallyIvr"]) {
        self.speciallyIvr =[NSString stringWithFormat:@"%@===转换模型之后我再修改的数据",self.speciallyIvr];
        self.afterTramSetValue = @"转换模型之后自己赋值";
        return YES;
    }
    return NO;
}

//方法作用于根据Model对象创建JSON之后，该方法可以对生成的JSON字典做一些处理。
- (BOOL)modelCustomTransformToDictionary:(NSMutableDictionary *)dic{
    [dic setValue:@"字段砖模型之后改变字典值" forKey:@"新key"];
    
    return YES;
}


@end


@interface KBYYModelViewController ()

@end

@implementation KBYYModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self yymodel];
}


- (void)yymodel{
    
    NSDictionary *dict = @{
        
        @"name":@"zhang",
        @"age":@16,
        @"college":@{@"name":@"CollegeName"}
    };
    
    
    //用字典调用两个方法均可以转换成model, yy_modelWithJSON 内部做了兼容, 转化成dict, 内部调用yy_modelWithDictionary
    
// model嵌套可直接转换
    Student *stJson = [Student yy_modelWithJSON:dict];
    Student *stDict = [Student yy_modelWithDictionary:dict];

    NSLog(@"yy_modelWithJSON ==== %@",stJson.description);
    NSLog(@"yy_modelWithDictionary ==== %@",stDict.description);
  
   id object=  [stJson yy_modelToJSONObject];//字典
    id object1=  [stJson yy_modelToJSONData];//data
    id object2=  [stJson yy_modelToJSONString];//json

    
    
    /*
     NSArray + yymodel
     */
    NSArray *studentArr =
             @[@{@"name" : @"Tomy", @"age" : @18, @"college" : @{@"name" : @"NJU"}},
         @{@"name" : @"Alex", @"age" : @19, @"college" : @{@"name" : @"Harvard"}},
         @{@"name" : @"Sunny", @"age" : @20, @"college" : @{@"name" : @"Yale"}}];
    
    //生成model 数组
    NSArray *stuArr = [NSArray yy_modelArrayWithClass:Student.class json:studentArr];
    
    
    
    /*
     NSDictory + yymodel
     */
    
    NSDictionary *playerDic =
      @{@"player1" : @{@"name" : @"Tomy",
                       @"age" : @18,
                       @"college" : @{@"name" : @"NJU"}},
      @"player2" : @{@"name" : @"Alex",
                     @"age" : @19,
                     @"college" : @{@"name" : @"Yale"}}};

    NSDictionary *yyDict  = [NSDictionary yy_modelDictionaryWithClass:Student.class json:playerDic];
    //生成字典, value为model
    //    @{@"player1":model1,
    //      @"player2":model2
    //    }
    
    
    
    /*
     映射关系 mapper  modelCustomPropertyMapper
     */
    
    NSDictionary *studentDic = @{@"name" : @"Tomy",
                                    @"age" : @18,
                                   @"BIGAGE" : @{@"num":@20},
                                 @"college" : @{@"name" : @"NJU"}};

    
    Student *stMapeer = [Student yy_modelWithJSON:studentDic];
    
    
    
    /*
     嵌套 模型数组   modelContainerPropertyGenericClass
     */
    NSDictionary *studentDic1 =
      @{@"name" : @"Tomy",
        @"age" : @18,
        @"college" : @{@"name" : @"NJU"},
        @"mobilePhones" : @[@{@"phoneNumber" : @123456},
                            @{@"phoneNumber" : @123456}]};
    
    
    
    Student *strContainer = [Student yy_modelWithJSON:studentDic1];
    
    
    
    
    /*
     * 根据字典中的值, 重新转换成对应 类型(Class)的模型
     *name = Graduated   Student实现了modelCustomClassForDictionary 方法, 指定了转换成的模型的类型
     最后生成的 strCusCls 实际类型其实为 Graduated
    */
    NSDictionary *dictCus = @{
        @"name":@"Graduated",
        @"age":@16,
        @"college":@{@"name":@"CollegeName"}
    };
    Student *strCusCls = [Student yy_modelWithJSON:dictCus];
    
    
    
    
    /*
     modelCustomWillTransformFromDictionary
     字典转模型之前如果需要修改字典中的值, 可实现此方法修改字典, 并返回修改后的字典
     */
    
    NSDictionary *dictWillTra = @{
        @"name":@"小明",
        @"age":@16,
        @"college":@{@"name":@"CollegeName"},
        @"speciallyIvr":@"转换前特特殊处理"
    };
    Student *strWillTranfrom = [Student yy_modelWithJSON:dictWillTra];
    
    
    /*
     modelCustomTransformFromDictionary
     字典转模型之后如果需要修改字典中的值, 可实现此方法修改字典, 并返回修改后的字典
     */
    
    NSDictionary *dictTraform = @{
        @"name":@"小明",
        @"age":@16,
        @"college":@{@"name":@"CollegeName"},
        @"speciallyIvr":@"转换后特特殊处理"
    };
    Student *strTranfrom = [Student yy_modelWithJSON:dictTraform];
    
    
    
    /*
    模型 砖json, 字典, 生成前改值
    */
    
    NSDictionary *diclatter= [strTranfrom yy_modelToJSONObject];
    
    NSLog(@"");
    
    
    


}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
