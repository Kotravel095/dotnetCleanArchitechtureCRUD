Ö

`/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_1.Domain/Common/BaseEntity.cs
	namespace 	
_1
 
. 
Domain 
. 
Common 
; 
public 
abstract 
class 

BaseEntity  
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
}  
=! "
Guid# '
.' (
NewGuid( /
(/ 0
)0 1
;1 2
public 

DateTime 
	CreatedAt 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
DateTime. 6
.6 7
UtcNow7 =
;= >
public 

DateTime 
	UpdatedAt 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
DateTime. 6
.6 7
UtcNow7 =
;= >
public 

bool 
IsActive 
{ 
get 
; 
set  #
;# $
}% &
=' (
true) -
;- .
}		 _
]/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_1.Domain/Entities/Blogs.cs”
`/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_1.Domain/Entities/Products.cs
	namespace 	
_1
 
. 
Domain 
. 
Entities 
; 
public 
class 
Products 
: 

BaseEntity "
{ 
public 

string 
Name 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
public 

string 
Description 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
public		 

decimal		 
Price		 
{		 
get		 
;		 
set		  #
;		# $
}		% &
}

 l
j/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_1.Domain/Interfaces/IBlogsRepository.csè

m/Users/jeerawat/Documents/project/dotnetCleanArchitecture/backend/_1.Domain/Interfaces/IProductsRepository.cs
	namespace 	
_1
 
. 
Domain 
. 

Interfaces 
; 
public 
	interface 
IProductsRepository $
{ 
Task 
< 	
IEnumerable	 
< 
Products 
> 
> 
GetAllAsync  +
(+ ,
), -
;- .
Task 
< 	
Products	 
> 
GetByIdAsync 
(  
Guid  $
id% '
)' (
;( )
Task		 
<		 	
Products			 
>		 
AddAsync		 
(		 
Products		 $
products		% -
)		- .
;		. /
Task

 
<

 	
Products

	 
>

 
UpdateAsync

 
(

 
Guid

 #
Id

$ &
,

& '
Products

( 0
products

1 9
)

9 :
;

: ;
Task 
< 	
Products	 
> 
DeleteAsync 
( 
Guid #
id$ &
)& '
;' (
} 