#include<stdio.h>
#define nf 4
int p[100], input[100];
int n,pagecount=0,pagehit=0 ;
void initialise(){
    for (int i = 0; i < nf; i++)
    {
        p[i]=999;
    }
}
void print(){
    for(int i =0;i < nf;i++){

        if(p[i]!=999){
            printf(" %d ",p[i]);
        }
    }
}
int isHit(int x){
    for (int i = 0; i < nf; i++)
    {
        if(x==p[i]){
            return 1;
        }
    }
    return 0;
}
void LRU(){
 initialise();
 int near[50];
for (int i = 0; i < n; i++)
{
    printf("\nFor %d : ",input[i]);
    if(isHit(input[i])==0){
        for(int j=0;j<nf;j++){
        int found=0;
        int  pg=p[j];
        for(int k=i+1;k>=0;k--){
            if(pg==input[k]){
                found=1;
                near[j]=k;
                break;
            }
        }
        if(found==0){
            near[j]=-999;
        }
        }
        int index,max=999;
        for(int j=0;j<nf;j++){
            if (near[j]<max)
            {
                max=near[j];
                index=j;
            }
        } 
        p[index]=input[i];
        pagecount++;
        print();
    }
    else{
        pagehit++;
        printf("\nPage Hit");
    }
}
printf("\n The number of page faults are : %d ",pagecount );
printf("\n The number of page hits are : %d",pagehit);

}
void main(){
    
    printf("\nEnter number of pages in page reference string :");
    scanf("%d",&n);
    printf("\nEnter page reference string: ");
    for (int i = 0; i < n; i++)
    {
        scanf("%d",&input[i]);
    }
    LRU();
}