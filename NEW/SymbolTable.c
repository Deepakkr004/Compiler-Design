/*#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define TABLE_SIZE 100
// Structure to represent Symbeol Table

typedef structure Symbol{
char *name;
int value;
struct Symbol*next;
}
Symbol;
//Hash table
Symbol *hashTable[TABLE_SIZE];
//hash function
unsigned int hash(const char*name)
{
unsigned int hash_value=0;
while(*name)
{
hash_Value=(hashValue<<5)+*name++;
}
return hashValue%TABLESIZE;
}
//Insert hahvalue
void insert(const char* name ,int value)
{
unsigned int index=hash(name);
Symbol *newSymbol=(Symbol)*malloc(sizeof(Symbol));
newSymbol->name=strdup(name);
newSymol->value=value;
newSymbol->next=hashTable[index];
hashTable[index]=newSymbol;
}
//Search for a symbol
Symbol *search(const char *name)
{
unsigned int index=hash(name);
Symbol *current=hashTable[index];
while(current !=NULL)
{
if(strcmp(current ->name,name)==0)
{
return current;
}
current = current->next;
}
return NULL;
}
//Delete
void delete(const char *name)
{
unsigned int index=hash(name);
Symbol *current=hashTable[index];
Symbol *prev=NULL;
while(current !=NULL && strcmp(current->name,name)!=0)
{
prev=current;
current=current->next;
}
if(current==NULL){
return;
}
if(prev==NULL)
{
hashTable[index]=current->next;
}
else
{
prev->next=current->next;
}
free(current->name);
free(current);
/Display
void display()
{
for(int i=0;i<TABLE_SIZE:i++)
{Symbol *current=hashTable[i];
if(current!==NULL)
{
printf("Index %d:\n",i);
while(current!==NULL)
{
printf("Name:%s,Value:%d\n",curent->name,current->value);
current=current->next;
}
}
}
}
int main()
{
//init hash table
for(int i=0;i<YABLE_SIZE;i++)
{
hashTable[i]=NULL;
}
//Example
insert("x',10);
insert("y",20);
insert("z",30);
Symbol *sym=search("y");
if(sym!=NULL)
{
printf("Found Sybol:name:%s,Value:%d\n",sym->name,sym->value);
}
else
{
printf("Symbol not found\n");
}
delete ("y");
sym=search("y");
if(sym!=NULL)
{
printf("Found symbol :Name:%s,value:%d\n",sym->name,sym->value);
}
else
{
printf("Symbol not found \n");
}
display();
return 0;
}
*/
#include<stdio.h>

#include<stdlib.h>

#include<string.h>
 
#define TABLE_SIZE 100
 
typedef struct Symbol {

  char *name;

  int value;

  struct Symbol *next;

} Symbol;
 
Symbol *hashTable[TABLE_SIZE];
 
unsigned int hash(const char *name) {

  unsigned int hashValue = 0;

  while(*name) {

    hashValue = (hashValue << 5) + *name++;

    }

  return hashValue % TABLE_SIZE;

}
 
void insert(const char *name , int value) {

  unsigned int index = hash(name);

  Symbol *newSymbol = (Symbol *)malloc(sizeof(Symbol));

  newSymbol->name = strdup(name);

  newSymbol->value = value;

  newSymbol->next = hashTable[index];

  hashTable[index] = newSymbol;

}
 
Symbol *search(const char *name) {

   unsigned int index =  hash(name);

   Symbol *current = hashTable[index];

   while (current!=NULL) {

     if (strcmp(current->name, name) == 0) {

       return current;

     }

     current = current->next;

   }

   return NULL;

}
 
void delete(const char *name) {

   unsigned int index =  hash(name);

   Symbol *current = hashTable[index];

   Symbol *prev = NULL;

   while(current != NULL && strcmp(current->name,name)!=0) {

     prev = current;

     current = current -> next;

   }

   if(current ==NULL)  {

     return;

   }

   if(prev==NULL){

     hashTable[index] = current->next;

   }

   else {

     prev->next =current->next;

   }

   free(current->next);

   free(current);

}
 
void display() {

   for(int i=0;i<TABLE_SIZE;i++) {

     Symbol *current = hashTable[i];

     if(current!=NULL) {

       printf("Index %d:\n",i);

       while(current!=NULL) {

         printf(" Name: %s,Value: %d\n",current->name,current->value);

         current = current->next;

         }

       }

    }

}
 
int main() {

   for(int i=0;i<TABLE_SIZE;i++) {

     hashTable[i]=NULL;

   }

   insert("x",10);

   insert("y",20);

   insert("z",30);

   Symbol *sym = search("y");

   if(sym!=NULL) {

     printf("Found symbol: Name:%s,Value: %d\n",sym->name,sym->value);

   }else {

     printf("Symbol not found\n");

   }

   delete("y");

   sym = search("y");

   if(sym!=NULL) {

     printf("Found symbol: Name:%s,Value: %d\n",sym->name,sym->value);

   }else {

     printf("Symbol not found\n");

   }

   display();

   return 0;

}

 


