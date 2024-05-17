//First Fit
#include<stdio.h>
int blocks[100], process[100], p , b;
void FirstFit(){
    int block_allocation[p],visited[b];
    for (int i = 0; i < p; i++)
    {
        block_allocation[i]=-1;
    }
    for (int i = 0; i < b; i++)
    {
        visited[i]=0;
    }
    for (int i = 0; i < p; i++)
    {
        for (int j = 0; j < b; j++)
        {
            if(blocks[j]>=process[i]&& visited[j]==0){
                block_allocation[i]=j;
                break;
            }
        }
        if(block_allocation[i]!=-1){
            visited[block_allocation[i]]=1;
        }
    }
    printf("\nMemory Allocation Details:");
    for (int i = 0; i < p; i++)
    {
        if (block_allocation[i]!=-1)
        {
            printf("\nProcess of size %d is allocated to block of size %d ",process[i],blocks[block_allocation[i]]);

        }
        else{
            printf("\nProcess of size %d is not allocated to any block ",process[i]);
        }
    }
}
void main(){
    printf("\nEnter number of process : ");
    scanf("%d",&p);
    printf("\nEnter number of blocks : ");
    scanf("%d",&b);
    for (int i = 0; i < p; i++)
    {
        printf("\nEnter the size %d process : ",i+1);
        scanf("%d",&process[i]);
    }
    for (int i = 0; i < b; i++)
    {
        printf("\nEnter the size %d block : ",i+1);
        scanf("%d",&blocks[i]);
    }
    FirstFit();   
}