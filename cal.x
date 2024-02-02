struct num{
	float a;
	float b;
};

program CALCULATOR{
	version CALVERSION{
	   float sum(num)=1;
	   float sub(num)=2;
	   float mul(num)=3;
	   float div(num)=4;
	}=1;
}=0x12345678;