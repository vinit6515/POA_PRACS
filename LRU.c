#include<stdio.h>
#define nf 4
int p[100];
int in[100];
int pagefault=0;
int pagehit=0;
int k;
//Sample input string 70120304230323
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
void LRU(int n){
    initialise();
    int near[50];
    for (int  i = 0; i < n ; i++)
    {
        printf("\nFor %d : ", in[i] );
        if(isHit(in[i])==0){
            for(int j =0;j<nf;j++){
                int found=0;
                int page=p[j];
                for(k=i+1;k>=00;k--){
                    if(in[k]==page){
                        found=1;
                        near[j]=k;
                        break;
                    }
                }
                if(found==0){
                    near[j]=-999;
                }
            }
            int index;
            int min=999;
            for(int j=0;j<nf;j++){
                if(near[j]<min){
                    min=near[j];
                    index=j;
                }
            }
            p[index]=in[i];
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
    LRU(n);
}