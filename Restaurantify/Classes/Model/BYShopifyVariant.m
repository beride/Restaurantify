//
//  BYShopifyVariant.m
//  Restaurantify
//
//  Created by Will Fairclough on 11-11-05.
//  Copyright (c) 2011 Superna. All rights reserved.
//

#import "BYShopifyVariant.h"

@implementation BYShopifyVariant
@synthesize position;
@synthesize price;
@synthesize title;
@synthesize inventoryPolicy;
@synthesize inventoryQuantity;
@synthesize inventoryManagement;
@synthesize fulfillmentService;
@synthesize option1;
@synthesize option2;
@synthesize option3;
@synthesize grams;
@synthesize sku;
@synthesize compareAtPrice;

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if ((self = [self init]) != NULL)
    {
        [self setObjectWithDictionary:dictionary];
    }
    return(self);
}

- (void)setRequiresShippingStr:(NSString *)newRequiresShippingStr {
    
    if ([newRequiresShippingStr isEqualToString:@"false"]) {
        requiresShipping = NO;
    } else {
        requiresShipping = YES;
    }
}

- (BOOL)requiresShipping {
    return requiresShipping;
}

- (void)setObjectWithDictionary:(NSDictionary *)variantDictionary {
    

    
    for (NSString *key in [variantDictionary allKeys]) {
        id value = [variantDictionary objectForKey:key];
        
        if ([key isEqualToString:@"price"]) {
            [self setPrice:value];
        } else if ([key isEqualToString:@"position"]) {
            [self setPosition:value];
        } else if ([key isEqualToString:@"created_at"]) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSString *dateStr = (NSString *)value;
            dateStr = [dateStr stringByReplacingOccurrencesOfString:@"T" withString:@" "];
            dateStr = [dateStr stringByReplacingOccurrencesOfString:@"Z" withString:@""];
            NSDate *date = [dateFormatter dateFromString:dateStr];
            
            [self setCreatedAt:date];
        } else if ([key isEqualToString:@"title"]) {
            [self setTitle:value];
        } else if ([key isEqualToString:@"requires_shipping"]) {
            NSNumber *numBool = (NSNumber *)value;
            if ([numBool isEqualToNumber:[NSNumber numberWithInt:0]]) {
                requiresShipping = NO;
            } else {
                requiresShipping = YES;
            }
        } else if ([key isEqualToString:@"updated_at"]) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSString *dateStr = (NSString *)value;
            dateStr = [dateStr stringByReplacingOccurrencesOfString:@"T" withString:@" "];
            dateStr = [dateStr stringByReplacingOccurrencesOfString:@"Z" withString:@""];
            NSDate *date = [dateFormatter dateFromString:dateStr];
            
            [self setUpdatedAt:date];
        } else if ([key isEqualToString:@"inventory_policy"]) {
            [self setInventoryPolicy:value];
        } else if ([key isEqualToString:@"compare_at_price"]) {
            [self setCompareAtPrice:value];
        } else if ([key isEqualToString:@"inventory_quantity"]) {
            [self setInventoryQuantity:value];
        } else if ([key isEqualToString:@"inventory_management"]) {
            [self setInventoryManagement:value];
        } else if ([key isEqualToString:@"taxable"]) {
            NSNumber *numBool = (NSNumber *)value;
            if ([numBool isEqualToNumber:[NSNumber numberWithInt:0]]) {
                taxable = NO;
            } else {
                taxable = YES;
            }
        } else if ([key isEqualToString:@"id"]) {
            [self setIdentifier:value];
        } else if ([key isEqualToString:@"grams"]) {
            [self setGrams:value];
        } else if ([key isEqualToString:@"sku"]) {
            [self setSku:value];
        } else if ([key isEqualToString:@"option1"]) {
            [self setOption1:value];
        } else if ([key isEqualToString:@"option2"]) {
            [self setOption2:value];           
        } else if ([key isEqualToString:@"option3"]) {
            [self setOption3:value];
        } else if ([key isEqualToString:@"fulfillment_service"]) {
            [self setFulfillmentService:value];
        }
        
        
        
    }
}
@end