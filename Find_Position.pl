#print ("Select your input file : \t");
#$f=<>;
#chomp $f;
$f=@ARGV[0];							#User input
chomp $f;

#print ("select annotation file : \t");
#$f1=<>;
#chomp $f1;
$f1=@ARGV[1];							#User input
chomp $f1;

open(file1,"$f") or die "File does not exist $f";
while(<file1>)
{
	chomp();
	@a=split(",");
	$Name.=@a[0].",";
	$Call.=@a[1].",";
	$Position.=@a[2].",";
}
close(file1);
@Name1=split(",",$Name);
@Call1=split(",",$Call);
@Position1=split(",",$Position);

open(file2,"$f1") or die "file does not exist $f1";
while(<file2>)
{
	chomp;
	@b=split(",");
	$Locus.=@b[1].",";
	$model.=@b[2].",";
	$Start.=@b[3].",";
	$End.=@b[4].",";
	$Ori.=@b[5].",";
	$Discription.=@b[9].",";
}
close(file2);
@Locus1=split(",",$Locus);
@Model1=split(",",$model);
@Start1=split(",",$Start);
@End1=split(",",$End);
@Ori1=split(",",$Ori);
@Discription1=split(",",$Discription);
open(file3,">Result.csv");

for($i=0;$i<scalar(@Position1);$i++)
{
	for($j=0;$j<scalar(@Start1);$j++)
	{
		if(@Position1[$i]>=@Start1[$j] && @Position1[$i]<=@End1[$j])
		{
			print file3 "@Position1[$i],@Locus1[$j],@Model1[$j],@Start1[$j],@End1[$j],@Ori1[$j],@Discription1[$j],,";
		}		
	}
	print file3 "\n";
}
close(file3);