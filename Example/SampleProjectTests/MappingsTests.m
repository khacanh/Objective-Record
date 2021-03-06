//
//  MappingsTests.m
//  SampleProject
//
//  Created by Marin Usalj on 5/28/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Kiwi.h"
#import "Person.h"
#import "Car.h"

SPEC_BEGIN(MappingsTests)

describe(@"Mappings", ^{
    
    it(@"caches mappings", ^{
        Car *car = [Car create];
        [[car should] receive:@selector(mappings) andReturn:@{ @"hp": @"horsePower" } withCount:1];
        
        [car update:@{ @"hp": @150 }];
        [car update:@{ @"make": @"Ford" }];
        [car update:@{ @"hp": @150 }];
    });
    
    it(@"uses mapped values when creating", ^{
        Person *marin = [Person create:@{ @"first_name": @"Marin", @"last_name": @"Usalj", @"age": @24 }];
        [[marin.firstName should] equal:@"Marin"];
        [[marin.lastName should] equal:@"Usalj"];
        [[marin.age should] equal:@24];
    });
    
    it(@"can support snake_case even without mappings", ^{
        Person *member = [Person create:@{ @"is_member": @YES }];
        [[member.isMember should] beTrue];
    });
    
});

SPEC_END
