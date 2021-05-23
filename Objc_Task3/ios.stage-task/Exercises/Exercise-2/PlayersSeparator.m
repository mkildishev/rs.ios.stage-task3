#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger result =[self dividePlayersIntoTeams:ratingArray team:@[]];
    NSLog(@"RESULT: %lu", (long)result);
    return result;
}

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *> *)ratingArray
                               team:(NSArray<NSNumber *> *)teamRatingArray  {
    NSInteger teamFormedCount = 0;
    if (teamRatingArray.count == 3) {
        NSLog(@"We have a team %@", teamRatingArray);
        return 1; // Team was formed
    }
    for (int i = 0; i < ratingArray.count; ++i) {
        NSIndexSet* idxSetOfNewArray = [NSIndexSet indexSetWithIndexesInRange: NSMakeRange(i+1, ratingArray.count - (i+1))];
        if (teamRatingArray.count == 0) {
            teamFormedCount = teamFormedCount + [self dividePlayersIntoTeams:[ratingArray objectsAtIndexes:idxSetOfNewArray] team:[NSArray arrayWithObjects: ratingArray[i], nil]];
        } else if (teamRatingArray.count < 2) {
            teamFormedCount = teamFormedCount + [self dividePlayersIntoTeams:[ratingArray objectsAtIndexes:idxSetOfNewArray] team:[teamRatingArray arrayByAddingObject:ratingArray[i]]];
        } else if (([ratingArray[i] compare:teamRatingArray[teamRatingArray.count - 1]] == NSOrderedDescending
                    && [teamRatingArray[teamRatingArray.count - 1] compare:teamRatingArray[teamRatingArray.count - 2]] == NSOrderedDescending)  ||
                   ([ratingArray[i] compare:teamRatingArray[teamRatingArray.count - 1]] == NSOrderedAscending
                    && [teamRatingArray[teamRatingArray.count - 1] compare:teamRatingArray[teamRatingArray.count - 2]] == NSOrderedAscending)){
            NSArray* newTeam = [teamRatingArray arrayByAddingObject:ratingArray[i]];
            teamFormedCount =  teamFormedCount + [self dividePlayersIntoTeams:[ratingArray objectsAtIndexes:idxSetOfNewArray] team:newTeam];
        }
    }
    return teamFormedCount;
}

@end
