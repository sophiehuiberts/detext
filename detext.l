%s Normal Math Inner InnerMath Begin
%%
	int indentation = 0;
	int arguments = 1;
	int mathnext = 0;
	BEGIN Normal;
	

\n	ECHO;

<Normal>{
	"$$"		BEGIN Math;
	"$"		BEGIN Math;
	"\\$"		;
	"\\("		BEGIN Math;
	"\\["		BEGIN Math;
	"\\\\"		;
	"\\begin"	{
			BEGIN Begin;
			mathnext = 0;
			}
	" "		ECHO;
	.		;
}

<Math>{
	"$$"		BEGIN Normal;
	"$"		BEGIN Normal;
	"\\$"		ECHO;
	"\\)"		BEGIN Normal;
	"\\]"		BEGIN Normal;
	"\\\\"		ECHO;
	"\\end"		BEGIN Normal;
	"\\mbox"	BEGIN Inner;
	"\\intertext"	BEGIN Inner;
	"\\end(?=\s*\{\s*(align|equation|flalign|tabular|eqnarray|displaymath))" BEGIN Normal;
	.		ECHO;
}

<Inner>{
	"$$"		BEGIN InnerMath;
	"$"		BEGIN InnerMath;
	"\\("		BEGIN InnerMath;
	"\\["		BEGIN InnerMath;
	"\\\\"		;
	"\\begin"	BEGIN InnerMath;
	"\\{"		;
	"\\}"		;
	"\{"		indentation++;
	"\}"		if(--indentation == 0){BEGIN Math;}else{if(indentation < 0){printf("ERROR");}}
	.		;
}

<InnerMath>{
	"$$"		BEGIN Inner;
	"$"		BEGIN Inner;
	"\\$"		ECHO;
	"\\)"		BEGIN Inner;
	"\\]"		BEGIN Inner;
	"\\\\"		ECHO;
	.		ECHO;
}

<Begin>{
	align		{mathnext = 1; arguments = 1;}
	equation	{mathnext = 1; arguments = 1;}
	tabular		{mathnext = 1; arguments = 2;}
	eqnarray	{mathnext = 1; arguments = 1;}
	displaymath	{mathnext = 1; arguments = 1;}
	"\}"		{if(--arguments <= 0) {
				if(mathnext){
					BEGIN Math;
				} else {
					BEGIN Normal;
				}
			}}
	.		;
}

%%
