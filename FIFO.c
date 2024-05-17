#include<stdio.h>
#define nf 3
int p[100];
int in[100];
int pagefault=0;
int pagehit=0;
int k;
void initialise(){
    for (int i = 0; i < nf; i++)
    {
        p[i]=999;
    }
    
}
int isHit(int n ){
    for (int i = 0; i < nf; i++)
    {
        if(p[i]==n){
            return 1;

        }
    }
    return 0;
    
}
void print(){
    for (int i = 0; i < nf; i++)
    {   
        if(p[i]!=999)
        printf(" %d ",p[i]);
    }
    printf("\n");
}
void FIFO(int n){
    initialise();
    for (int  i = 0; i < n ; i++)
    {
        printf("\nFor %d : ", in[i] );
        if(isHit(in[i])==0){
            for(k=0;k<nf-1;k++)
            p[k]=p[k+1];
            p[k]=in[i];
            pagefault++;
            print();
        }
        else{
            printf("\nPage Hit");
            pagehit++;
        }
    }
    printf("\nThe total numbber of page faults are : %d",pagefault);
    printf("\nThe total number of page hits are %d",pagehit);
}
void main(){
    int n ;
    printf("\nEnter number of pages in page reference string :");
    scanf("%d",&n);
    printf("\nEnter page reference string: ");
    for (int i = 0; i < n; i++)
    {
        scanf("%d",&in[i]);
    }
    FIFO(n);
}