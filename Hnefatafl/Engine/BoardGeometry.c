//
//  BoardGeometry.c
//  Hnefatafl
//
//  Created by Tony Jinks on 18/10/2019.
//  Copyright © 2019 Tony Jinks. All rights reserved.
//

#include <stdlib.h>
#include "BoardGeometry.h"

Square *bg;
static Square *edge;

static void initializeEdge(void)
{
    edge = bg + numSquares;
    edge->east = edge;
    edge->north = edge;
    edge->south = edge;
    edge->west = edge;
    edge->isEdge = true;
    edge->isCentre = false;
    edge->isEscape = false;
}

static void initializeIndexes(void)
{
    for (int i = 0; i < boardSize + 1; i++) {
        bg[i].index = i;
    }
}

static void initializeAdjacent(void)
{
    for (int y = 0; y < boardSize; y++) {
        for (int x = 0; x < boardSize; x++) {
            int index = x + boardSize * y;
            Square *sq = bg + index;
            sq->east = (x > 0 ? sq - 1 : edge);
            sq->west = (x < boardSize - 1 ? sq + 1 : edge);
            sq->north = (y < boardSize - 1 ? sq + boardSize : edge);
            sq->south = (y > 0 ? sq - 1 : edge);
        }
    }
}

static void initializeFlags(void)
{
    for (int y = 0; y < boardSize; y++) {
        for (int x = 0; x < boardSize; x++) {
            int index = x + boardSize * y;
            Square *sq = bg + index;
            sq->isCentre = false;
            sq->isEscape = false;
            if (x == 0 && y == 0) {
                sq->isEscape = true;
            }
            if (x == 0 && y == boardSize - 1) {
                sq->isEscape = true;
            }
            if (x == boardSize - 1 && y == 0) {
                sq->isEscape = true;
            }
            if (x == boardSize - 1 && y == boardSize - 1) {
                sq->isEscape = true;
            }
            int centre = (boardSize - 1) / 2;
            if (x == centre && y == centre) {
                sq->isCentre = true;
            }
        }
    }
}

void setupBoardGeometry(void)
{
    bg = calloc(numSquares + 1, sizeof(Square));
    initializeEdge();
    initializeIndexes();
    initializeAdjacent();
    initializeFlags();
}

