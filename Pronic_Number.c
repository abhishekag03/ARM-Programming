#include <stdio.h>

void main(){
	int c;
	scanf("%d",&c);    //storing input in c
	// printf("%d",c );
	int num=0;
	int pro=0;
	while (pro<=c){
		printf("%d", pro);  //printing the current value of product
		num=num+1;			//incrementing num by 1
		pro=num*(num+1);	//incrementing the product
		// printf("%d",num);
		printf("%s"," " );		//space between the outpus
	}
}
