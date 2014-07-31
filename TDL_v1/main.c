#include <windows.h>
//#include <iostream>
//#include <stdlib.h>
#include <malloc.h>
#include <string.h>

//#include "st.h"
//#include "rtwtypes.h"

//using namespace std;


	typedef void(*Init)(void);
	typedef void(*st_step)(void);
	typedef void(*End)(void);

typedef struct{
	HINSTANCE hDll;
	Init init_fun;
	st_step sim_step;
	End end_fun;
	double* st_uin;
	double* st_yout;
	//int hInit;
	//int hStep;
	//int hTer;
	//int hIn;
	//int hOut;
	//char dll_name[100];
	//char init_name[100];
	//char step_name[100];
	//char ter_name[100];
	//char out_name[100];
	//char in_name[100];
	//char* dll_name;
	//char* init_name;
	//char* step_name;
	//char* ter_name;
	//char* out_name;
	//char* in_name;
} Handle;

//void* initialization(char* dll_name)
//{
//
//}

//HINSTANCE hDll;
//int number_in;
//int number_out;

/*参数列表*/
///////////////////////////////////////
/*
dll_path    dll的保存路径
init_name   dll中的初始化函数名字
num_input   模型输入的个数
num_output  模型输出的个数
*/

void assignment(const char* src,char* des)
{
	//int len=strlen(src);
	//*des=(char*)malloc((len+1)*sizeof(char));
	int i;
	for(i=0;i<strlen(src);i++)
	{
		des[i]=src[i];
	}
	des[i]='\0';
}



void* initHandle(const char* dll_name,const char* init_name,const char* step_name,const char* ter_name,const char* in_name,const char* out_name)
{
	Handle* hand=malloc(sizeof(Handle));
	if ( hand == NULL ) ModelicaError("Not enough memory");

	//number_in=num_input;
	//number_out=num_output;

	hand->hDll=LoadLibrary(dll_name);
	if(hand->hDll!=NULL)
	{
		//hand->hDll=(int)hDll;
		hand->init_fun=(Init)(GetProcAddress(hand->hDll,init_name));
		hand->sim_step=(st_step)(GetProcAddress(hand->hDll,step_name));
		hand->end_fun=(End)(GetProcAddress(hand->hDll,ter_name));
		hand->st_uin=(double*)(GetProcAddress(hand->hDll,in_name));
		hand->st_yout=(double*)(GetProcAddress(hand->hDll,out_name));

		//assignment(dll_name,(hand->dll_name));
		//assignment(init_name,(hand->init_name));
		//assignment(step_name,(hand->step_name));
		//assignment(ter_name,(hand->ter_name));
		//assignment(in_name,(hand->in_name));
		//assignment(out_name,(hand->out_name));
		//hand->dll_name=dll_name;
		//hand->init_name=init_name;
		//hand->step_name=step_name;
		//hand->ter_name=ter_name;
		//hand->in_name=in_name;
		//hand->out_name=out_name;
		//init_fun=(Init)(GetProcAddress(hDll,init_name));
		if(hand->init_fun!=NULL)
			hand->init_fun();
		//else
		//	cout<<"can not get init function!"<<endl;
	}
	return (void*) hand;
	//else
	//	cout<<"Can not load .dll!"<<endl;
}


/////////*参数列表*///////////////
//////////////////////////////////
/*
in_name    dll中输入变量的名字
out_name   dll中输出变量的名字
step_name  dll中更新函数的名字
in         外部输入数组变量的名字
size_in    外部输入数组变量的长度
out        输出数组变量的名字
size_out   输出数组变量的长度
*/
void per_step(void* object,const double* in,int size_in,double* out,int size_out)
{
	int i=0;
	//typedef void(*st_step)(void);
	//st_step sim_step;
	//double* st_uin;
	//double* st_yout;
	Handle* hand=(Handle*) object;

	//st_uin=(double*)(GetProcAddress(hand->hDll,hand->in_name));
	if(hand->st_uin!=NULL)
	{
		for(i=0;i<size_in;i++)
			hand->st_uin[i]=in[i];
	}
	//else
	/*{
		cout<<"can not get ball_U!"<<endl;
	}*/
	//sim_step=(st_step)(GetProcAddress(hand->hDll,hand->step_name));
	if(hand->sim_step!=NULL)
		hand->sim_step();
	//else
	//{
	//	cout<<"can not get ball_step function!"<<endl;
	//}
			
	//st_yout=(double*)(GetProcAddress(hand->hDll,hand->out_name));
	if(hand->st_yout!=NULL)
	{
		for(i=0;i<size_out;i++)
			out[i]=hand->st_yout[i];
	}	
	//else
	//{
	//	cout<<"can not get yout!"<<endl;
	//}

	//else
	//{
	//	cout<<"does not load .dll"<<endl;
	//}	
}

////////////////////////////////////
/*
ter_name     dll中结束函数的名字
*/

void closeHandle(void* object)
{
	//typedef void(*End)(void);
	//End end_fun;
	Handle* hand=(Handle*) object;
	//if(hDll!=NULL)
	//{
	//end_fun=(End)(GetProcAddress(hand->hDll,hand->ter_name));
	if(hand->end_fun!=NULL)
		hand->end_fun();

	//else
	//	cout<<"can not get init function!"<<endl;
	FreeLibrary(hand->hDll);
	//free(hand->hDll);
	//free(hand->dll_name);
	//free(hand->init_name);
	//free(hand->step_name);
	//free(hand->ter_name);
	//free(hand->in_name);
	//free(hand->out_name);
	free(hand);
	//}
	//else
	//	cout<<"does not load .dll!"<<endl;
}



//int main(int argc,char *argv[])
//{
//	initialization("st_win32.dll","st_initialize",2,1);
//	double* in=new double[number_in];
//	in[0]=8;
//	in[1]=2;
//	double* out=new double[number_out];
//	for(int i=0;i<10;i++)
//	{
//		per_step("st_U","st_Y","st_step",in,number_in,out,number_out);
//		for(int i=0;i<number_out;i++)
//			cout<<out[i]<<endl;
//	}	
//	termination("st_terminate");
//	return 1;
//}