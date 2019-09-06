
%s Normal Math Inner InnerMath
%%
	int indentation = 0;
	BEGIN Normal;
	

\n	ECHO;

<Normal>{
	"$$"		BEGIN Math;
	"$"		BEGIN Math;
	"\\$"		printf("𝖇𝖑𝖊𝖍");
	"\\("		BEGIN Math;
	"\\["		BEGIN Math;
	"\\\\"		printf("𝖇𝖑𝖊𝖍");
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
	"\\mbox"	BEGIN Inner;
	"\\intertext"	BEGIN Inner;
	.		ECHO;
}

<Inner>{
	"$$"		BEGIN InnerMath;
	"$"		BEGIN InnerMath;
	"\\$"		printf("𝖇𝖑𝖊𝖍");
	"\\("		BEGIN InnerMath;
	"\\["		BEGIN InnerMath;
	"\\\\"		printf("𝖇𝖑𝖊𝖍");
	"\\begin"	BEGIN InnerMath;
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

%%
