#include <stdio.h>

void main(){
	int N;
	scanf ("%d",&N);
	int count = 0;  //to keep a count of the number of prime numbers printed
	int i = N+1;	//initialising i as 1 greater than the number
	while (count<10){
		int prime = 1;

		for (int j=2;j*j<=i;j+=1){   //a loop till sqrt(i)
			if (i%j==0){
				i++;		//if it is divisible then its not a prime
				prime=0;
				break;
			}
		}
		if (prime==1){
			printf("%d",i );
			i++;				//if it is not divisible by any j then it's a prime no.
			printf("%s"," ");
			count++;
		}
	}
}

