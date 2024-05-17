#include<conio.h>
#include<stdio.h>
int block[100],process[100],b , p;
void WorstFit(){
    int block_allocation[b],visited[p];
    for (int i = 0; i < b; i++)
    {
        block_allocation[i]=-1;
    }
    for (int i = 0; i < p; i++)
    {
        visited[i]=0;
    }
    for(int i =0;i<p;i++){

        int min=-999;
        for(int j=0;j<b;j++){
            if(block[j]-process[i]>min&& visited[j]==0&& block[j]-process[i]>=0){
                block_allocation[i]=j;
                min=block[j]-process[i];
            }
        }
        if(block_allocation[i]!=-1){
            visited[block_allocation[i]]=1;
        }
    }
    printf("\nMemory Allocation Details");
    for (int i = 0; i < p; i++)
    {
            if(block_allocation[i]!=-1){
                printf("\nProcess of size %d is allocated to block of size %d ",process[i],block[block_allocation[i]]);
            }
            else{
                printf("\nProcess of size %d is not allocated ", process[i]);
            }   
    }   
}
void main(){
    printf("\nEnter number of blocks: ");
    scanf("%d",&b);
    printf("\nEnter number of processes: ");
    scanf("%d",&p);
    for (int i = 0; i < b; i++)
    {
        printf("\nEnter size of %d block ",i+1);
        scanf("%d",&block[i]);
    }
    for (int i = 0; i < p; i++)
    {
        printf("\nEnter size of %d process",i+1);
        scanf("%d",&process[i]);
    }
    WorstFit();
}