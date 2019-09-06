%s Normal Math Inner InnerMath

%%
	BEGIN Normal;

\n	ECHO;

<Normal>{
	"$$"		BEGIN Math;
	"$"		BEGIN Math;
	"\\$"		;
	"\\("		BEGIN Math;
	"\\["		BEGIN Math;
	"\\\\"		;
	"\\begin"	BEGIN Math;
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
	.		ECHO;
}
%%
