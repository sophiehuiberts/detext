%s Normal Math Inner InnerMath

%%
	BEGIN Math;

\n	ECHO;

<Normal>{
	"$$"		printf("bluh");
	"$"		printf("bluh.");
	"\\$"		;
	"\\("		printf("bluh?");
	"\\["		printf("bluh,");
	"\\\\"		;
	"\\begin"	printf("bluh!");
	.		;
}

<Math>{
	"$$"		printf("bleh");
	"$"		printf("bleh.");
	"\\$"		ECHO;
	"\\)"		printf("bleh?");
	"\\]"		printf("bleh,");
	"\\\\"		ECHO;
	"\\end"		printf("𝖇𝖑𝖊𝖍");	
}
%%
