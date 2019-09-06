%s Normal Math Inner InnerMath Begin
%%
	int indentation = 0;
	int arguments = 0;
	int mathnext = 0;
	BEGIN Normal;
	

\n	ECHO;

<Normal>{
	"$$"		BEGIN Math;
	"$"		BEGIN Math;
	"\\$"		printf("𝖇𝖑𝖊𝖍");
	"\\("		BEGIN Math;
	"\\["		BEGIN Math;
	"\\\\"		printf("𝖇𝖑𝖊𝖍");
	"\\begin"	{
			BEGIN Begin;
			mathnext = 0;
			}
	" "		ECHO;
	.		printf("𝖇𝖑𝖊𝖍");
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
	.		ECHO;
}

<Inner>{
	"$$"		BEGIN InnerMath;
	"$"		BEGIN InnerMath;
	"\\("		BEGIN InnerMath;
	"\\["		BEGIN InnerMath;
	"\\\\"		printf("𝖇𝖑𝖊𝖍");
	"\\begin"	BEGIN InnerMath;
	"\\{"		printf("𝖇𝖑𝖊𝖍");
	"\\}"		printf("𝖇𝖑𝖊𝖍");
	"\{"		indentation++;
	"\}"		if(--indentation == 0){BEGIN Math;}else{if(indentation < 0){printf("ERROR");}}
	.		printf("𝖇𝖑𝖊𝖍");
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
	algorithm	{mathnext = 1; arguments = 1;}
	displaymath	{mathnext = 1; arguments = 1;}
	"\}"		{if(--arguments == 0) {
				if(mathnext){
					BEGIN Math;
				} else {
					BEGIN Normal;
				}
			}}
	.		;
}

%%
