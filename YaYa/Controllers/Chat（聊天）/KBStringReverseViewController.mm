//
//  KBStringReverseViewController.m
//  YaYa
//
//  Created by yawei.zhang on 2021/1/14.
//  Copyright © 2021 msxf. All rights reserved.
//

#import "KBStringReverseViewController.h"
@interface KBStringReverseViewController ()

@end

@implementation KBStringReverseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *str =  [self stringReverse:@"12345678"];
    NSLog(@"%@",str);
    
}


- (NSString *)stringReverse:(NSString *)oriString{
    NSMutableString *mStr = [NSMutableString string];
    
    NSInteger length = oriString.length;
    for (NSInteger i = length - 1; i>=0; i--) {
        [mStr appendString:[oriString substringWithRange:NSMakeRange(i, 1)]];
    }
    
    return mStr;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    char_reverse("abcdefg");
//    [self my_stringByReversing:@"12345678"];
    
//    char_reverse("mnopqrst");
//    [self fib:5];
//
//    reverse("12345");
    
//   NSInteger a = [self erFen:@[@1,@3,@5,@7,@8] targetValue:@7];
//    NSLog(@"%ld",(long)a);
//
//
//    NSArray * arr = @[@1,@3,@5,@7,@8];
//    NSInteger b = [self erFenDiGui:arr targetValue:@7 left:0 right:arr.count - 1];
//     NSLog(@"%ld",(long)b);
    
    NSArray *arr =[self twoSum:@[@1,@3,@6,@9] target:9];
    NSLog(@"%@",arr);
    
//    multiply(123, 789);
}


- (void)reverseString:(NSString *)string{
//    for (int i = 0; i < string.length / 2; i ++) {
//        NSArray * strArr = string
//    }
}


- (NSString *)my_stringByReversing:(NSString *)oriString {
    NSInteger length = oriString.length;
    
    NSMutableString *reversed = [NSMutableString stringWithCapacity:length];
    NSRange range = NSMakeRange(0, length);

    [oriString enumerateSubstringsInRange:range
                                  options:NSStringEnumerationByComposedCharacterSequences
                               usingBlock:^(NSString * _Nullable substring, NSRange substringRange,
                                            NSRange enclosingRange, BOOL * _Nonnull stop) {
    [reversed insertString:substring atIndex:0];
    }];
    
    return [reversed copy];
}




//移动指针,交换字符
//一直移动到所有字符都交换完毕，退出条件 begin >=end



void char_reverse(char *cha)

{
    //指向第一个字符
    char *begin = cha;
    //指向最后一个字符
    char *end = cha + strlen(cha) - 1;
    while (begin < end) {
        //交换前后两个字符串，同时移动指针
        char temp = *begin;
        *(begin++) = *end;
        *(end--) = temp;
    }
}
    

void reverse(char* str)
{
    char* p = str + strlen(str)-1;
    char temp;
    while(str<p)
    {
        temp=*p;
        *p--=*str;
        *str++=temp;
    }
}



- (NSInteger)fib:(NSUInteger)index{
    if (index == 0) {
        return 0;
    }
    if (index == 1) {
        return 1;
    }
    NSArray *arr= [NSArray array];
    NSMutableArray <NSNumber *>*mArr = [NSMutableArray arrayWithCapacity:index];
    for (int i = 0; i <=index ; i ++) {
        [mArr addObject:@0];
    }
    mArr[0] = @0;
    mArr[1] = @1;
    for (NSUInteger i = 2; i<= index; i ++) {
        mArr[i] = [NSNumber numberWithInteger:[mArr[i - 1] integerValue] + [mArr[i - 2] integerValue]] ;
        NSLog(@"%@ ===%lu",mArr[i],(unsigned long)i);
    }
    NSLog(@"%ld",(long)[mArr[index] integerValue]);
    return [mArr[index] integerValue];
}

// 二分查找
- (NSUInteger)erFen:(NSArray *)arr targetValue:(NSValue *)targetValue{
    NSUInteger left = 0;
    NSUInteger right = arr.count - 1;
    
    while (left <= right) {
        NSUInteger mid = left + ((right - left)>>1);
        if (arr[mid]  == targetValue) {
            return mid;
        }else if(arr[mid] < targetValue){
            left = mid + 1;
        }else if(arr[mid] > targetValue){
            right = mid  - 1;
        }
    }
    return -1;
}

// 二分查找 递归法
- (NSUInteger)erFenDiGui:(NSArray *)arr targetValue:(NSValue *)targetValue left:(NSUInteger)left right:(NSUInteger)right{
    NSUInteger mid = left + ((right - left) >>1);
    while (left <= right) {
        if (arr[mid] == targetValue) {
            return mid;
        }else if (arr[mid] < targetValue){
            left = mid + 1;
            return  [self erFenDiGui:arr targetValue:targetValue left:left right:right];
        }else if (arr[mid] > targetValue){
            right = mid - 1;
            return  [self erFenDiGui:arr targetValue:targetValue left:left right:right];
        }
    }
    return  -1;
}


- (NSArray *)twoSum:(NSArray <NSNumber *> *)arr target:(NSUInteger)target{
    NSMutableDictionary *dictM = [NSMutableDictionary dictionaryWithCapacity:arr.count];
    [dictM setValue:arr[0] forKey:[NSString stringWithFormat:@"%d",0]];
    
    for (int i = 1; i< arr.count -1; i++) {
        NSUInteger anther = target - [arr[i] integerValue];
        NSArray *ar = [dictM allValues];
        NSNumber *num = [NSNumber numberWithInteger:anther];
        if ([ar containsObject:num] ) {
           __block NSInteger index = 0;
            [dictM enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                if ([obj isEqualToNumber:num]){
                    index = [(NSString *)key integerValue];
                }
            }];
            return @[@(i), @(index)] ;
        }
        [dictM setValue:arr[i] forKey:[NSString stringWithFormat:@"%d",i]];

    }
    return @[@0,@0];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

//string multiply(string num1, string num2) {
//        string ans;
//        vector<int> a, b, c;
//        c.resize(num1.size() + num2.size() - 1);
//        for (int i = num1.size() - 1; i >= 0; i--) a.push_back(num1[i] - '0');
//        for (int i = num2.size() - 1; i >= 0; i--) b.push_back(num2[i] - '0');
//        for (int i = 0; i < a.size(); i++) {
//            for (int j = 0; j < b.size(); j++) {
//                c[i + j] += a[i] * b[j];
//            }
//        }
//        int k = 0;
//        for (int i = 0; i < c.size(); i++) {
//            k += c[i];
//            char c = k % 10 + '0';
//            ans = c + ans;
//            k /= 10;
//        }
//        while (k) {
//            char c = k % 10 + '0';
//            ans = c + ans;
//            k /= 10;
//        }
//        while (ans.size() > 1 && ans[0] == '0') ans.erase(ans.begin());
//        return ans;
//    }


@end
