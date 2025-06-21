…
Ñ/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_3.Infrastructure/Migrations/20250621083111_CreateTableProducts.cs
	namespace 	
_3
 
. 
Infrastructure 
. 

Migrations &
{ 
public		 

partial		 
class		 
CreateTableProducts		 ,
:		- .
	Migration		/ 8
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str  
,  !
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 D
,D E
nullableF N
:N O
falseP U
)U V
,V W
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 D
,D E
	maxLengthF O
:O P
$numQ S
,S T
nullableU ]
:] ^
false_ d
)d e
,e f
Description 
=  !
table" '
.' (
Column( .
<. /
string/ 5
>5 6
(6 7
type7 ;
:; <
$str= L
,L M
	maxLengthN W
:W X
$numY \
,\ ]
nullable^ f
:f g
falseh m
)m n
,n o
Price 
= 
table !
.! "
Column" (
<( )
decimal) 0
>0 1
(1 2
type2 6
:6 7
$str8 G
,G H
nullableI Q
:Q R
falseS X
)X Y
,Y Z
	CreatedAt 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= H
,H I
nullableJ R
:R S
falseT Y
)Y Z
,Z [
	UpdatedAt 
= 
table  %
.% &
Column& ,
<, -
DateTime- 5
>5 6
(6 7
type7 ;
:; <
$str= H
,H I
nullableJ R
:R S
falseT Y
)Y Z
,Z [
IsActive 
= 
table $
.$ %
Column% +
<+ ,
bool, 0
>0 1
(1 2
type2 6
:6 7
$str8 =
,= >
nullable? G
:G H
falseI N
)N O
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 2
,2 3
x4 5
=>6 8
x9 :
.: ;
Id; =
)= >
;> ?
} 
) 
; 
} 	
	protected!! 
override!! 
void!! 
Down!!  $
(!!$ %
MigrationBuilder!!% 5
migrationBuilder!!6 F
)!!F G
{"" 	
migrationBuilder## 
.## 
	DropTable## &
(##& '
name$$ 
:$$ 
$str$$  
)$$  !
;$$! "
}%% 	
}&& 
}'' Ü
É/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_3.Infrastructure/Persistence/MongoDB/DBContext/MongoDbContext.csä
á/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_3.Infrastructure/Persistence/MongoDB/Repositories/BlogsRepository.csç
ä/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_3.Infrastructure/Persistence/MongoDB/Repositories/ProductsRepository.cs£
ç/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_3.Infrastructure/Persistence/MSSQL/Configurations/ProductsConfiguration.cs
	namespace 	
_3
 
. 
Infrastructure 
. 
Persistence '
.' (
MSSQL( -
.- .
Configuration. ;
;; <
public 
class !
ProductsConfiguration "
:# $$
IEntityTypeConfiguration% =
<= >
Products> F
>F G
{ 
public		 

void		 
	Configure		 
(		 
EntityTypeBuilder		 +
<		+ ,
Products		, 4
>		4 5
builder		6 =
)		= >
{

 
builder 
. 
HasKey 
( 
a 
=> 
a 
. 
Id 
) 
; 
builder 
. 
Property 
( 
m 
=> 
m 
. 
Name !
)! "
. 

IsRequired 
( 
) 
. 
HasMaxLength 
( 
$num 
) 
; 
builder 
. 
Property 
( 
m 
=> 
m 
. 
Description (
)( )
. 
HasMaxLength 
( 
$num 
) 
; 
builder 
. 
ToTable 
( 
$str 
)  
;  !
} 
} ⁄

Å/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_3.Infrastructure/Persistence/MSSQL/DBContext/MssqlDbContext.cs
	namespace 	
_3
 
. 
Infrastructure 
. 
Persistence '
.' (
MSSQL( -
.- .
	DBContext. 7
;7 8
public 
class 
MssqlDbContext 
: 
	DbContext '
{ 
public		 

MssqlDbContext		 
(		 
DbContextOptions		 *
<		* +
MssqlDbContext		+ 9
>		9 :
options		; B
)		B C
:		D E
base		F J
(		J K
options		K R
)		R S
{		T U
}		U V
public 

DbSet 
< 
Products 
> 
Products #
{$ %
get& )
;) *
set+ .
;. /
}0 1
	protected 
override 
void 
OnModelCreating +
(+ ,
ModelBuilder, 8
builder9 @
)@ A
{ 
builder 
. 
ApplyConfiguration "
(" #
new# &!
ProductsConfiguration' <
(< =
)= >
)> ?
;? @
} 
} à
Ö/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_3.Infrastructure/Persistence/MSSQL/Repositories/BlogsRepository.cs¡'
à/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_3.Infrastructure/Persistence/MSSQL/Repositories/ProductsRepository.cs
	namespace 	
_3
 
. 
Infrastructure 
. 
Persistence '
.' (
MSSQL( -
.- .
Repositories. :
;: ;
public

 
class

 
ProductsRepository

 
:

  !
IProductsRepository

" 5
{ 
private 
readonly 
MssqlDbContext #
_context$ ,
;, -
public 

ProductsRepository 
( 
MssqlDbContext ,
context- 4
)4 5
{ 
_context 
= 
context 
; 
} 
public 

async 
Task 
< 
IEnumerable !
<! "
Products" *
>* +
>+ ,
GetAllAsync- 8
(8 9
)9 :
{ 
return 
await 
_context 
. 
Products &
.& '
AsNoTracking' 3
(3 4
)4 5
.5 6
ToListAsync6 A
(A B
)B C
;C D
} 
public 

async 
Task 
< 
Products 
? 
>  
GetByIdAsync! -
(- .
Guid. 2
Id3 5
)5 6
{ 
return 
await 
_context 
. 
Products &
.& '
	FindAsync' 0
(0 1
Id1 3
)3 4
;4 5
} 
public 

async 
Task 
< 
Products 
> 
AddAsync  (
(( )
Products) 1
products2 :
): ;
{ 
await 
_context 
. 
Products 
.  
AddAsync  (
(( )
products) 1
)1 2
;2 3
await   
_context   
.   
SaveChangesAsync   '
(  ' (
)  ( )
;  ) *
return!! 
products!! 
;!! 
}"" 
public$$ 

async$$ 
Task$$ 
<$$ 
Products$$ 
?$$ 
>$$  
UpdateAsync$$! ,
($$, -
Guid$$- 1
Id$$2 4
,$$4 5
Products$$6 >
updatedProduct$$? M
)$$M N
{%% 
var&& 
existingProduct&& 
=&& 
await&& #
_context&&$ ,
.&&, -
Products&&- 5
.&&5 6
	FindAsync&&6 ?
(&&? @
Id&&@ B
)&&B C
;&&C D
if'' 

('' 
existingProduct'' 
=='' 
null'' #
)''# $
return''% +
null'', 0
;''0 1
existingProduct)) 
.)) 
Name)) 
=)) 
updatedProduct)) -
.))- .
Name)). 2
;))2 3
existingProduct** 
.** 
Description** #
=**$ %
updatedProduct**& 4
.**4 5
Description**5 @
;**@ A
existingProduct++ 
.++ 
Price++ 
=++ 
updatedProduct++  .
.++. /
Price++/ 4
;++4 5
existingProduct,, 
.,, 
	UpdatedAt,, !
=,," #
DateTime,,$ ,
.,,, -
UtcNow,,- 3
;,,3 4
_context.. 
... 
Products.. 
... 
Update..  
(..  !
existingProduct..! 0
)..0 1
;..1 2
await// 
_context// 
.// 
SaveChangesAsync// '
(//' (
)//( )
;//) *
return11 
existingProduct11 
;11 
}22 
public44 

async44 
Task44 
<44 
Products44 
?44 
>44  
DeleteAsync44! ,
(44, -
Guid44- 1
Id442 4
)444 5
{55 
var66 
product66 
=66 
await66 
_context66 $
.66$ %
Products66% -
.66- .
	FindAsync66. 7
(667 8
Id668 :
)66: ;
;66; <
if77 

(77 
product77 
==77 
null77 
)77 
return77 #
null77$ (
;77( )
_context88 
.88 
Products88 
.88 
Remove88  
(88  !
product88! (
)88( )
;88) *
await99 
_context99 
.99 
SaveChangesAsync99 '
(99' (
)99( )
;99) *
return:: 
product:: 
;:: 
};; 
}<< 