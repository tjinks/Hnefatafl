//
//  BoardGeometry.h
//  Hnefatafl
//
//  Created by Tony Jinks on 18/10/2019.
//  Copyright © 2019 Tony Jinks. All rights reserved.
//

#ifndef BoardGeometry_h
#define BoardGeometry_h

#include <stdbool.h>

const int boardSize = 11;
const int numSquares = boardSize * boardSize;

struct Square {
    struct Square *north, *south, *east, *west;
    int index;
    bool isEdge;
    bool isEscape;
    bool isCentre;
};

typedef struct Square Square;

extern Square *bg;

void setupBoardGeometry(void);

#endif /* BoardGeometry_h */
