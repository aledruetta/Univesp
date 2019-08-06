/*
 * =====================================================================================
 *
 *       Filename:  static_linked_list.h
 *
 *    Description:  Lista Ligada (Implementação Estática)
 *
 *        Version:  1.0
 *        Created:  06/08/2019 08:06:20
 *       Revision:  none
 *       Compiler:  g++
 *
 *         Author:  Alejandro Druetta
 *   Organization:  Univesp - Eng. Computação
 *
 * =====================================================================================
 */

#ifndef STATIC_LINKED_LIST_H
#define STATIC_LINKED_LIST_H

#include <string>

#define INVALID -1
#define MAX 50

using namespace std;

typedef int KEY;

struct User
{
    KEY key;
    string name;
    // otros campos
};

User userConstructor (KEY key, string name);

template <typename T>
class Node
{
    public:
        Node () {
            next_node = INVALID;
        }
        Node (T rec) {
            record = rec;
            next_node = INVALID;
        }
        T record;
        int next_node;
};


template <typename T>
class List
{
    public:
        List () {
            start = -1;
            available = 0;
        }
        Node <T> nodes[MAX];
        int start;
        int available;
};


#endif /* STATIC_LINKED_LIST_H */

