Œ
o/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_2.Application/Common/Constants/ErrorCodes.cs
	namespace 	
_2
 
. 
Application 
. 
Common 
.  
	Constants  )
;) *
public 
static 
class 

ErrorCodes 
{ 
public 

const 
string 
NotFound  
=! "
$str# 2
;2 3
public 

const 
string 

Validation "
=# $
$str% 5
;5 6
public 

const 
string 
InternalServer &
=' (
$str) >
;> ?
} “
w/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_2.Application/Common/Exceptions/NotFoundException.cs
	namespace 	
_2
 
. 
Application 
. 
Common 
.  

Exceptions  *
;* +
public 
class 
NotFoundException 
:  
	Exception! *
{ 
public 

string 
Code 
{ 
get 
; 
} 
public 

NotFoundException 
( 
string #

entityName$ .
,. /
object0 6
key7 :
): ;
: 	
base
 
( 
$" 
{ 

entityName 
} 
$str (
{( )
key) ,
}, -
$str- =
"= >
)> ?
{		 
Code

 
=

 
$str

 
;

 
} 
} Ì
h/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_2.Application/Common/Models/Result.cs
	namespace 	
_2
 
. 
Application 
. 
Common 
.  
Models  &
;& '
public 
class 
Result 
< 
T 
> 
{ 
public 

bool 
Success 
{ 
get 
; 
set "
;" #
}$ %
public 

string 
? 
Message 
{ 
get  
;  !
set" %
;% &
}' (
public 

string 
? 
	ErrorCode 
{ 
get "
;" #
set$ '
;' (
}) *
public 

T 
? 
Data 
{ 
get 
; 
set 
; 
}  
public

 

static

 
Result

 
<

 
T

 
>

 
Ok

 
(

 
T

  
data

! %
,

% &
string

' -
?

- .
message

/ 6
=

7 8
null

9 =
)

= >
=> 

new 
( 
) 
{ 
Success 
= 
true !
,! "
Message# *
=+ ,
message- 4
,4 5
Data6 :
=; <
data= A
}B C
;C D
public 

static 
Result 
< 
T 
> 
Fail  
(  !
string! '
message( /
,/ 0
string1 7
?7 8
	errorCode9 B
=C D
nullE I
)I J
=> 

new 
( 
) 
{ 
Success 
= 
false "
," #
Message$ +
=, -
message. 5
,5 6
	ErrorCode7 @
=A B
	errorCodeC L
}M N
;N O
} c
a/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_2.Application/DTOs/BlogsDto.csœ
d/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_2.Application/DTOs/ProductsDto.cs
	namespace 	
_2
 
. 
Application 
. 
DTOs 
; 
public 
class 
ProductsDto 
{ 
public 

Guid 
Id 
{ 
get 
; 
set 
; 
}  
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
public 

string 
Description 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
public 

decimal 
Price 
{ 
get 
; 
set  #
;# $
}% &
}		 
public 
class 
AddProductsDto 
{ 
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
public 

string 
Description 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
public 

decimal 
Price 
{ 
get 
; 
set  #
;# $
}% &
} n
l/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_2.Application/Interfaces/IBlogsService.csž
o/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_2.Application/Interfaces/IProductsService.cs
	namespace 	
_2
 
. 
Application 
. 

Interfaces #
;# $
public 
	interface 
IProductsService !
{ 
Task 
< 	
Result	 
< 
IEnumerable 
< 
ProductsDto '
>' (
>( )
>) *
GetAllAsync+ 6
(6 7
)7 8
;8 9
Task		 
<		 	
Result			 
<		 
ProductsDto		 
>		 
>		 
GetByIdAsync		 *
(		* +
Guid		+ /
id		0 2
)		2 3
;		3 4
Task

 
<

 	
Result

	 
<

 
ProductsDto

 
>

 
>

 
AddAsync

 &
(

& '
AddProductsDto

' 5
dto

6 9
)

9 :
;

: ;
Task 
< 	
Result	 
< 
ProductsDto 
> 
> 
UpdateAsync )
() *
Guid* .
Id/ 1
,1 2
AddProductsDto3 A
dtoB E
)E F
;F G
Task 
< 	
Result	 
< 
ProductsDto 
> 
> 
DeleteAsync )
() *
Guid* .
id/ 1
)1 2
;2 3
} k
i/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_2.Application/Services/BlogsService.csæI
l/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_2.Application/Services/ProductsService.cs
	namespace 	
_2
 
. 
Application 
. 
Services !
;! "
public		 
class		 
ProductsService		 
:		 
IProductsService		 /
{

 
private 
readonly 
IProductsRepository (
_repository) 4
;4 5
public 

ProductsService 
( 
IProductsRepository .

repository/ 9
)9 :
{ 
_repository 
= 

repository  
;  !
} 
public 

async 
Task 
< 
Result 
< 
IEnumerable (
<( )
ProductsDto) 4
>4 5
>5 6
>6 7
GetAllAsync8 C
(C D
)D E
{ 
var 
products 
= 
await 
_repository (
.( )
GetAllAsync) 4
(4 5
)5 6
;6 7
var 
dtos 
= 
products 
. 
Select "
(" #
p# $
=>% '
new( +
ProductsDto, 7
{ 	
Id 
= 
p 
. 
Id 
, 
Name 
= 
p 
. 
Name 
, 
Description 
= 
p 
. 
Description '
,' (
Price 
= 
p 
. 
Price 
} 	
)	 

;
 
return 
Result 
< 
IEnumerable !
<! "
ProductsDto" -
>- .
>. /
./ 0
Ok0 2
(2 3
dtos3 7
.7 8
ToList8 >
(> ?
)? @
,@ A
$strB b
)b c
;c d
} 
public   

async   
Task   
<   
Result   
<   
ProductsDto   (
>  ( )
>  ) *
GetByIdAsync  + 7
(  7 8
Guid  8 <
Id  = ?
)  ? @
{!! 
var"" 
product"" 
="" 
await"" 
_repository"" '
.""' (
GetByIdAsync""( 4
(""4 5
Id""5 7
)""7 8
;""8 9
if## 

(## 
product## 
==## 
null## 
)## 
return## #
Result##$ *
<##* +
ProductsDto##+ 6
>##6 7
.##7 8
Fail##8 <
(##< =
$str##= P
)##P Q
;##Q R
var%% 
dto%% 
=%% 
new%% 
ProductsDto%% !
{&& 	
Id'' 
='' 
product'' 
.'' 
Id'' 
,'' 
Name(( 
=(( 
product(( 
.(( 
Name(( 
,((  
Description)) 
=)) 
product)) !
.))! "
Description))" -
,))- .
Price** 
=** 
product** 
.** 
Price** !
}++ 	
;++	 

return-- 
Result-- 
<-- 
ProductsDto-- !
>--! "
.--" #
Ok--# %
(--% &
dto--& )
,--) *
$str--+ K
)--K L
;--L M
}.. 
public00 

async00 
Task00 
<00 
Result00 
<00 
ProductsDto00 (
>00( )
>00) *
AddAsync00+ 3
(003 4
AddProductsDto004 B
dto00C F
)00F G
{11 
var22 
product22 
=22 
new22 
Products22 "
{33 	
Name44 
=44 
dto44 
.44 
Name44 
,44 
Description55 
=55 
dto55 
.55 
Description55 )
,55) *
Price66 
=66 
dto66 
.66 
Price66 
}77 	
;77	 

var99 
result99 
=99 
await99 
_repository99 &
.99& '
AddAsync99' /
(99/ 0
product990 7
)997 8
;998 9
var;; 

productDto;; 
=;; 
new;; 
ProductsDto;; (
{<< 	
Id== 
=== 
result== 
.== 
Id== 
,== 
Name>> 
=>> 
result>> 
.>> 
Name>> 
,>> 
Description?? 
=?? 
result??  
.??  !
Description??! ,
,??, -
Price@@ 
=@@ 
result@@ 
.@@ 
Price@@  
}AA 	
;AA	 

returnCC 
ResultCC 
<CC 
ProductsDtoCC !
>CC! "
.CC" #
OkCC# %
(CC% &

productDtoCC& 0
,CC0 1
$strCC2 H
)CCH I
;CCI J
}DD 
publicFF 

asyncFF 
TaskFF 
<FF 
ResultFF 
<FF 
ProductsDtoFF (
>FF( )
>FF) *
UpdateAsyncFF+ 6
(FF6 7
GuidFF7 ;
IdFF< >
,FF> ?
AddProductsDtoFF@ N
dtoFFO R
)FFR S
{GG 
varHH 
existingHH 
=HH 
awaitHH 
_repositoryHH (
.HH( )
GetByIdAsyncHH) 5
(HH5 6
IdHH6 8
)HH8 9
;HH9 :
ifII 

(II 
existingII 
==II 
nullII 
)II 
returnII $
ResultII% +
<II+ ,
ProductsDtoII, 7
>II7 8
.II8 9
FailII9 =
(II= >
$strII> Q
)IIQ R
;IIR S
existingKK 
.KK 
NameKK 
=KK 
dtoKK 
.KK 
NameKK  
;KK  !
existingLL 
.LL 
DescriptionLL 
=LL 
dtoLL "
.LL" #
DescriptionLL# .
;LL. /
existingMM 
.MM 
PriceMM 
=MM 
dtoMM 
.MM 
PriceMM "
;MM" #
varOO 
updatedOO 
=OO 
awaitOO 
_repositoryOO '
.OO' (
UpdateAsyncOO( 3
(OO3 4
IdOO4 6
,OO6 7
existingOO8 @
)OO@ A
;OOA B
varQQ 

productDtoQQ 
=QQ 
newQQ 
ProductsDtoQQ (
{RR 	
IdSS 
=SS 
updatedSS 
.SS 
IdSS 
,SS 
NameTT 
=TT 
updatedTT 
.TT 
NameTT 
,TT  
DescriptionUU 
=UU 
updatedUU !
.UU! "
DescriptionUU" -
,UU- .
PriceVV 
=VV 
updatedVV 
.VV 
PriceVV !
}WW 	
;WW	 

returnYY 
ResultYY 
<YY 
ProductsDtoYY !
>YY! "
.YY" #
OkYY# %
(YY% &

productDtoYY& 0
,YY0 1
$strYY2 H
)YYH I
;YYI J
}ZZ 
public\\ 

async\\ 
Task\\ 
<\\ 
Result\\ 
<\\ 
ProductsDto\\ (
>\\( )
>\\) *
DeleteAsync\\+ 6
(\\6 7
Guid\\7 ;
Id\\< >
)\\> ?
{]] 
var^^ 
existing^^ 
=^^ 
await^^ 
_repository^^ (
.^^( )
GetByIdAsync^^) 5
(^^5 6
Id^^6 8
)^^8 9
;^^9 :
if__ 

(__ 
existing__ 
==__ 
null__ 
)__ 
return__ $
Result__% +
<__+ ,
ProductsDto__, 7
>__7 8
.__8 9
Fail__9 =
(__= >
$str__> Q
)__Q R
;__R S
varaa 
productsaa 
=aa 
awaitaa 
_repositoryaa (
.aa( )
DeleteAsyncaa) 4
(aa4 5
Idaa5 7
)aa7 8
;aa8 9
varcc 

productDtocc 
=cc 
newcc 
ProductsDtocc (
{dd 	
Idee 
=ee 
productsee 
.ee 
Idee 
,ee 
Nameff 
=ff 
productsff 
.ff 
Nameff  
,ff  !
Descriptiongg 
=gg 
productsgg "
.gg" #
Descriptiongg# .
,gg. /
Pricehh 
=hh 
productshh 
.hh 
Pricehh "
}ii 	
;ii	 

returnkk 
Resultkk 
<kk 
ProductsDtokk !
>kk! "
.kk" #
Okkk# %
(kk% &

productDtokk& 0
,kk0 1
$strkk2 H
)kkH I
;kkI J
}mm 
}nn i
g/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_2.Application/Settings/DbSettings.cs