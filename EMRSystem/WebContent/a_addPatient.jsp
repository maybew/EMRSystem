<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
 <head>
		
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		
		<title>EMRS</title>
		
		<link rel="stylesheet" href="resources/css/reset.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="resources/css/invalid.css" type="text/css" media="screen" />	
	
		<script type="text/javascript" src="resources/scripts/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="resources/scripts/simpla.jquery.configuration.js"></script>
		<script type="text/javascript" src="resources/scripts/facebox.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.wysiwyg.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.datePicker.js"></script>
		<script type="text/javascript" src="resources/scripts/jquery.date.js"></script>
		<script type="text/javascript" src="resources/scripts/vanadium.js"></script>
		
	<script>
/*
 *本插件原作者Vanadium,原文请移步前往http://vanadiumjs.com/查看
 *本插件由Mr.Think中文整理,Mr.Think的博客:http://MrThink.net/
 *转载及使用请务必注明原作者.
*/
 //弹出信息样式设置
Vanadium.config = {
    valid_class: 'rightformcss',//验证正确时表单样式
    invalid_class: 'failformcss',//验证失败时该表单样式
    message_value_class: 'msgvaluecss',//这个样式是弹出信息中调用值的样式
    advice_class: 'failmsg',//验证失败时文字信息的样式
    prefix: ':',
    separator: ';',
    reset_defer_timeout: 100
}
//验证类型及弹出信息设置
Vanadium.Type = function(className, validationFunction, error_message, message, init) {
  this.initialize(className, validationFunction, error_message, message, init);
};
Vanadium.Type.prototype = {
  initialize: function(className, validationFunction, error_message, message, init) {
    this.className = className;
    this.message = message;
    this.error_message = error_message;
    this.validationFunction = validationFunction;
    this.init = init;
  },
  test: function(value) {
    return this.validationFunction.call(this, value);
  },
  validMessage: function() {
    return this.message;
  },
  invalidMessage: function() {
    return this.error_message;
  },
  toString: function() {
    return "className:" + this.className + " message:" + this.message + " error_message:" + this.error_message
  },
  init: function(parameter) {
    if (this.init) {
      this.init(parameter);
    }
  }
};
Vanadium.setupValidatorTypes = function() {
Vanadium.addValidatorType('empty', function(v) {
    return  ((v == null) || (v.length == 0));
  });
//***************************************以下为验证方法,使用时可仅保留用到的判断
Vanadium.addValidatorTypes([
	//匹配大小写的等值
    ['equal', function(v, p) {
      return v == p;
    }, function (_v, p) {
      return '输入的值必须与<span class="' + Vanadium.config.message_value_class + '">' + p + '相符\(区分大小写\)</span>.'
    }],
    //不匹配大小写的等值
    ['equal_ignore_case', function(v, p) {
      return v.toLowerCase() == p.toLowerCase();
    }, function (_v, p) {
      return '输入的值必须与<span class="' + Vanadium.config.message_value_class + '">' + p + '相符\(不区分大小写\)</span>.'
    }],
    //是否为空
    ['required', function(v) {
      return !Vanadium.validators_types['empty'].test(v);
    }, ' Could not be none!'],
    //强制选中 
    ['accept', function(v, _p, e) {
      return e.element.checked;
    }, '必须接受!'],
    //
    ['integer', function(v) {
      if (Vanadium.validators_types['empty'].test(v)) return true;
      var f = parseFloat(v);
      return (!isNaN(f) && f.toString() == v && Math.round(f) == f);
    }, '请输入一个正确的整数值.'],
    //数字
    ['number', function(v) {
      return Vanadium.validators_types['empty'].test(v) || (!isNaN(v) && !/^\s+$/.test(v));
    }, '请输入一个正确的数字.'],
    //
    ['digits', function(v) {
      return Vanadium.validators_types['empty'].test(v) || !/[^\d]/.test(v);
    }, '请输入一个非负整数,含0.'],
    //只能输入英文字母
    ['alpha', function (v) {
      return Vanadium.validators_types['empty'].test(v) || /^[a-zA-Z\u00C0-\u00FF\u0100-\u017E\u0391-\u03D6]+$/.test(v)   //% C0 - FF (? - ?); 100 - 17E (? - ?); 391 - 3D6 (? - ?)
    }, '请输入英文字母.'],
    //仅限ASCII编码模式下输入英文字母
    ['asciialpha', function (v) {
      return Vanadium.validators_types['empty'].test(v) || /^[a-zA-Z]+$/.test(v)   //% C0 - FF (? - ?); 100 - 17E (? - ?); 391 - 3D6 (? - ?)
    }, '请在ASCII下输入英文字母.'],
	//英文字母或正数
    ['alphanum', function(v) {
      return Vanadium.validators_types['empty'].test(v) || !/\W/.test(v)
    }, '请输入英文字母或正数.'],
	//邮箱验证
    ['email', function (v) {
      return (Vanadium.validators_types['empty'].test(v) || /\w{1,}[@][\w\-]{1,}([.]([\w\-]{1,})){1,3}$/.test(v))
    }, 'Please enter the correct format of email:wbhmaybe@gmail.com'],
    //网址
    ['url', function (v) {
      return Vanadium.validators_types['empty'].test(v) || /^(http|https|ftp):\/\/(([A-Z0-9][A-Z0-9_-]*)(\.[A-Z0-9][A-Z0-9_-]*)+)(:(\d+))?\/?/i.test(v)
    }, '请输入正确的网址,比如:http://www.mrthink.net'],
    //日期格式
    ['date_au', function(v) {
      if (Vanadium.validators_types['empty'].test(v)) return true;
      var regex = /^(\d{2})\/(\d{2})\/(\d{4})$/;
      if (!regex.test(v)) return false;
      var d = new Date(v.replace(regex, '$2/$1/$3'));
      return ( parseInt(RegExp.$2, 10) == (1 + d.getMonth()) ) && (parseInt(RegExp.$1, 10) == d.getDate()) && (parseInt(RegExp.$3, 10) == d.getFullYear() );
    }, 'Please enter the correct format of date:28/05/2010.'],
    //输入固定长度字符串
    ['length',
      function (v, p) {
        if (p === undefined) {
          return true
        } else {
          return v.length == parseInt(p)
        }
        ;
      },
      function (_v, p) {
        return '输入字符长度等于<span class="' + Vanadium.config.message_value_class + '">' + p + '</span>个.'
      }
    ],
    //
    ['min_length',
      function (v, p) {
        if (p === undefined) {
          return true
        } else {
          return v.length >= parseInt(p)
        }
        ;
      },
      function (_v, p) {
        return '输入字符长度不低于<span class="' + Vanadium.config.message_value_class + '">' + p + '</span>个.'
      }
    ],
    ['max_length',
      function (v, p) {
        if (p === undefined) {
          return true
        } else {
          return v.length <= parseInt(p)
        }
        ;
      },
      function (_v, p) {
        return '输入字符长度不大于<span class="' + Vanadium.config.message_value_class + '">' + p + '</span>个.'
      }
    ],
	//判断密码是相同
    ['same_as',
      function (v, p) {
        if (p === undefined) {
          return true
        } else {
          var exemplar = document.getElementById(p);
          if (exemplar)
            return v == exemplar.value;
          else
            return false;
        }
        ;
      },
      function (_v, p) {
        var exemplar = document.getElementById(p);
        if (exemplar)
          return '两次密码输入不相同.';
        else
          return '没有可参考值!'
      },
      "",
      function(validation_instance) {
        var exemplar = document.getElementById(validation_instance.param);
        if (exemplar){
          jQuery(exemplar).bind('validate', function(){
            jQuery(validation_instance.element).trigger('validate');
          });
        }
      }
    ],
	//ajax判断是否存在值
    ['ajax',
      function (v, p, validation_instance, decoration_context, decoration_callback) {
        if (Vanadium.validators_types['empty'].test(v)) return true;
        var success;
        if (decoration_context && decoration_callback) {
            
          jQuery.getJSON(p, {value: v, id: validation_instance.element.id}, function(data) {
				success = data.success;
              decoration_callback.apply(decoration_context, [[data], false]);
          });
        }
        return true;
      }, 'failed']
    ,
    ['validate',
     function (v, p) {
    if (Vanadium.validators_types['empty'].test(v)) return true;
     var flag=$.ajax({
     type:'GET',
     url: 'verify',
     data:{value:v, type:p},
     success:function(msg){
     $.noop;
     },
     async:false
     }).responseText;
     
     if(flag==1){
     	return true;
     }else{
     	return false;
     };
     },
     'Already exits in database!'
     ],
	//正则匹配,此用法不甚理解
    ['format',
      function(v, p) {
        var params = p.match(/^\/(((\\\/)|[^\/])*)\/(((\\\/)|[^\/])*)$/);        
        if (params.length == 7) {
          var pattern = params[1];
          var attributes = params[4];
          try
          {
            var exp = new RegExp(pattern, attributes);
            return exp.test(v);
          }
          catch(err)
          {
            return false
          }
        } else {
          return false
        }
      },
      function (_v, p) {
        var params = p.split('/');
        if (params.length == 3 && params[0] == "") {
          return '输入的值必须与 <span class="' + Vanadium.config.message_value_class + '">' + p.toString() + '</span> 相匹配.';
        } else {
          return '提供的值与<span class="' + Vanadium.config.message_value_class + '">' + p.toString() + '</span>不匹配.';
        }
      }
    ]
  ])
  if (typeof(VanadiumCustomValidationTypes) !== "undefined" && VanadiumCustomValidationTypes) Vanadium.addValidatorTypes(VanadiumCustomValidationTypes);
};
</script>
	
	</head>
  
	<body><div id="body-wrapper">
	<%@ include file="inc/a_navigation.jsp"%>
		
		
		<div id="main-content"> <!-- Main Content Section with everything -->
			
			<noscript> <!-- Show a notification if the user has disabled javascript -->
				<div class="notification error png_bg">
					<div>
						Javascript is disabled or is not supported by your browser. Please <a href="http://browsehappy.com/" title="Upgrade to a better browser">upgrade</a> your browser or <a href="http://www.google.com/support/bin/answer.py?answer=23852" title="Enable Javascript in your browser">enable</a> Javascript to navigate the interface properly.
					Download From <a href="http://www.exet.tk">exet.tk</a></div>
				</div>
			</noscript>
			
			<!-- Page Head -->
			<h2>Welcome</h2>
            <div> <!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->
		<form action="signup">
		<input type="hidden" name="type" value="patient" />
            <h3>Add New Patient&nbsp;|&nbsp;<input type="submit" value="Save" class="button"></h3>
            <p class="p_line">
       <div  id="detail_facebox">
                <a href="#"><img src="resources/img/Add.jpg"></a>
            </div>
            <p style="margin-left:260px;color: #062856;">Health Insurance</p>
            
            <div class="detail">


				<p class="float_right"><strong>Username  </strong>:
                <p class="float_right"><strong>SSN  </strong>:
                <p class="float_right"><strong>Password  </strong>:
                <p class="float_right"><strong>First Name  </strong>:
                <p class="float_right"><strong>Last Name  </strong>:
                <p class="float_right"><strong>Gender  </strong>:
                <p class="float_right"><strong>Birth  </strong>:
                <p class="float_right"><strong>Address  </strong>:
                <p class="float_right"><strong>Phone  </strong>:
                <p class="float_right"><strong>E-mail  </strong>:
            </div>
            <div>
                <p class="float_left"><input name="pid" value="" class=":required :validate;pid">
                <p class="float_left"><input class=":required :validate;ssn" name="ssn" value="">
                <p class="float_left"><input class=":required" type="password" name="password" value="">
                <p class="float_left"><input class=":required" name="fname" value="">
                <p class="float_left"><input class=":required" name="lname" value="">
                <p class="float_left">
                    <select class="edit" name="gender">
                        <option value ="0">Male</option>
                        <option value ="1">Female</option>
                    </select>
                <p class="float_left"><input class=":date_au" name="birthdate" value="">
                <p class="float_left"><input class="edit" name="address" value="">
                <p class="float_left"><input class="edit" name="phone" value="">
                <p class="float_left"><input class=":email" name="email" value="">
            </div>
            
            <div class="detail_facebox"  style="width: 260px;">
                <p>Emergency Contact</p>
                    <div class="detail_1">
                        <p class="float_right"><strong>Name  </strong>:
                        <p class="float_right"><strong>Address  </strong>:
                        <p class="float_right"><strong>Phone  </strong>:
                        <p class="float_right"><strong>E-mail  </strong>:
                    </div>
                    <div >

                        <p class="float_left"><input class="edit" name="ename" value="">
                        <p class="float_left"><input class="edit" name="eaddress" value="">
                        <p class="float_left"><input class="edit" name="ephone" value="">
                        <p class="float_left"><input class="edit" name="eemail" value="">

                    </div>

            </div>
            <div class="detail_2" style="width: 250px;">
                <p>Health Insurance</p>
                <div class="detail_1">
                    <p class="float_right"><strong>Company  </strong>:
                    <p class="float_right"><strong>Address  </strong>:
                    <p class="float_right"><strong>Phone  </strong>:
                    <p class="float_right"><strong>Email  </strong>:
                    <p class="float_right"><strong>Type  </strong>:
                    <p class="float_right"><strong>Expiration  </strong>:
                </div>
                <div >

                    <p class="float_left"><input class="edit" name="icname" value="">
                    <p class="float_left"><input class="edit" name="icaddress" value="">
                    <p class="float_left"><input class="edit" name="icphone" value="">
                    <p class="float_left"><input class="edit" name="icemail" value="">
                    <p class="float_left"><input class="edit" name="icpolicynum" value="">
                    <p class="float_left"><input class="edit" name="icexpiredate" value="">

                </div>

            </div>
			</form>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
			<div class="clear"></div> <!-- End .clear -->

            <div id="footer">
                <small> <!-- Remove this notice or replace it with whatever you want -->
                    &#169; Copyright 2012 EMRS | Powered by <a href="#">EMRS</a> | <a href="#">Top</a>
                </small>
            </div><!-- End #footer -->
			
		</div> <!-- End #main-content -->
		
	</div></body>
  

<!-- Download From www.exet.tk-->
</html>
