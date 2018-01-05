<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/theme.css">
	<style>
#footer {
    padding: 15px 0;
    background: #fff;
    border-top: 1px solid #ddd;
    text-align: center;
}
#topcontrol {
  color: #fff;
  z-index: 99;
  width: 30px;
  height: 30px;
  font-size: 20px;
  background: #222;
  position: relative;
  right: 14px !important;
  bottom: 11px !important;
  border-radius: 3px !important;
}

#topcontrol:after {
  /*top: -2px;*/
  left: 8.5px;
  content: "\f106";
  position: absolute;
  text-align: center;
  font-family: FontAwesome;
}

#topcontrol:hover {
    color: #fff;
    background: #18ba9b;
    -webkit-transition: all 0.3s ease-in-out;
    -moz-transition: all 0.3s ease-in-out;
    -o-transition: all 0.3s ease-in-out;
    transition: all 0.3s ease-in-out;
}

.label-type, .label-status, .label-order {
    background-color: #fff;
    color: #f60;
    padding : 5px;
    border: 1px #f60 solid;
}
#typeList  :not(:first-child) {
    margin-top:20px;
}
.label-text {
    margin:0 10px;
}
.panel {
    border-radius:0;
}
	</style>
  </head>
  <body>
 <div class="navbar-wrapper">
      <div class="container">
			<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			  <div class="container">
				<div class="navbar-header">
				  <a class="navbar-brand" href="index.html" style="font-size:32px;">尚筹网-创意产品众筹平台</a>
				</div>
            <div id="navbar" class="navbar-collapse collapse" style="float:right;">
              <ul class="nav navbar-nav">
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> 张三<span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="member.html">会员中心</a></li>
                    <li><a href="message.html">消息 <span class="badge badge-success">42</span></a></li>
                    <li class="divider"></li>
                    <li><a href="index.html">退出系统</a></li>
                  </ul>
                </li>
              </ul>
            </div>
			  </div>
			</nav>
      </div>
    </div>

    <div class="container theme-showcase" role="main">

        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <nav class="navbar navbar-default" role="navigation">
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li>
                                    <a rel="nofollow" href="index.html"><i class="glyphicon glyphicon-home"></i> 众筹首页</a>
                                </li>
                                <li >
                                    <a rel="nofollow" href="projects.html"><i class="glyphicon glyphicon-th-large"></i> 项目总览</a>
                                </li>
                                <li class="active">
                                    <a rel="nofollow" href="javascript:;"><i class="glyphicon glyphicon-edit"></i> 发起项目</a>
                                </li>
                                <li>
                                    <a rel="nofollow" href="minecrowdfunding.html"><i class="glyphicon glyphicon-user"></i> 我的众筹</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        
        
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="panel panel-default" >
                        <div class="panel-heading" style="text-align:center;">
                            <h3 >
                                众筹平台项目发起人协议
                            </h3>
                        </div>
                        <div class="panel-body" style="height:400px;overflow-y:auto;padding:10px;">
<div class="test-box">
					<p><b>在发起人使用尚筹网众筹平台提供的服务之前，请务必认真阅读本协议的全部内容。阅读本协议的过程中，如您不同意本协议或其中任何条款约定，您应立即停止注册（如：点击确认等后续操作），撤销注册流程。本协议一经发起人点击确认并同意接受，即产生法律效力。
					</b></p>
					<h5>第1条  签约主体</h5>
					<p>本协议由尚筹网网站（包括但不限于www.atcrowd.com及尚筹网众筹平台）的所有者及其关联公司（以下简称为“尚筹网”），在尚筹网众筹平台（zc.atcrowd.com）与登录、使用尚筹网众筹平台的项目发起人（以下简称 “发起人”）共同签署（签约地：江苏省南京市）。</p>
					<h5>第2条  定 义</h5>
					<p>2.1 尚筹网众筹平台：尚筹网众筹平台是一个可以让发起人的项目计划变为现实的梦想平台，是“致力于中国创造，实现创新创业者梦想”的平台，发起人可以在尚筹网众筹平台上发起创新项目的筹款需求，并承诺提供不同形式的回报给项目的支持者，支持者可通过预购发起人的项目成果或相关产品来表达对发起人的支持。</p>
					<p>2.2发起人：指在尚筹网众筹平台上发起项目的法人。</p>
					<p>2.3支持者：指对发起人的项目表示支持的尚筹网用户，支持者通过支付一定金额的预购款的方式，预购项目的衍生成果及/或相关产品。</p>
					<p>2.4筹款成功：指在发起人设定的时间内，发起人与支持者订立的以项目成果及/或相关产品为回报标的的合同金额达到或超过了发起人设定的筹款金额。</p>
					<p>2.5项目成功：指项目筹款成功后，发起人执行项目计划并最终形成项目成果，并按照支持者预购订单的约定向支持者交付项目成果及/或相关产品。</p><p>
					</p><h5>第3条  立约背景</h5>
					<p>3.1为保护支持者的合法权益，规范发起人的行为，维护尚筹网众筹平台的秩序，特拟定本协议。</p>
					<p>3.2尚筹网为发起人与支持者之间的交易行为提供平台网络空间、技术服务和支持，尚筹网并不是发起人或支持者中的任何一方，所有交易仅存在于发起人和支持者之间，使用尚筹网众筹平台产生的法律后果由发起人与支持者自行承担。</p>
					<p>3.3尚筹网会对所发起的项目的合理性、项目内容与回报的匹配度等进行形式审核，审核通过后才可发布到尚筹网众筹平台，但是项目通过尚筹网的审核并不代表尚筹网保证项目合法或不侵犯任何第三方的权利，发起人仍需对所发起的项目独立承担法律责任。</p>
					<h5>第4条  协议生效和适用范围</h5>
					<p>4.1本协议内容包括协议正文以及尚筹网网站已经发布的或将来可能发布的各类规则、操作流程。所有规则为本协议不可分割的一部分，与协议正文具有同等的法律效力。</p>
					<p>4.2当发起人在尚筹网众筹平台发起项目时，通过网络页面点击确认或以其他方式选择接受本协议，即表示与尚筹网达成协议并接受本协议的全部约定内容，本协议自发起人通过网络页面点击确认或以其他方式选择接受本协议之时起生效。本协议生效后，发起人不应以未阅读或不接受本协议的内容为由，主张本协议无效或要求撤销本协议。</p>
					<p>4.3尚筹网有权根据需要不定时修改本协议或各类规则、操作流程，如本协议有任何变更，尚筹网将在网站上以公示形式通知，且无需征得发起人的事先同意。修改后的协议及规则一经公示即生效，成为本协议的一部分。如发起人继续登录或使用尚筹网众筹平台的，即视为已阅读并接受修改后的协议。</p>
					<p>4.4发起人应该按照本协议约定行使权利并履行义务。如不能接受本协议的约定，包括但不限于不能接受修订后的协议及各类规则，则应立即停止使用尚筹网众筹平台提供的服务。如发起人继续使用服务，则表示同意并接受本协议及各类规则的约束。</p>
					<h5>第5条  项目发起人资格</h5>
					<p>5.1项目发起人应为尚筹网众筹平台的注册用户，完全理解并接受本协议。</p>
					<p>5.2发起人可以为法人或其他组织且应是在中国境内合法成立、注册可独立承担法律责任的法律实体。</p>
					<p>5.3发起人在发起项目前，应通过尚筹网易付宝完成必要的身份认证和资质认证，包括但不限于营业执照、法人身份证等的实名认证。发起人在发起项目时同意并授权尚筹网众筹平台公示认证信息。</p>
					<p>5.4发起人应按照尚筹网的要求开立账户，以接收支持者的支持款。</p>
					<p>5.5如发起人申请发起的项目为带有公益性质的项目，则发起人应是合法成立的公益组织或与合法成立的公益组织共同发起项目。</p>
					<p>5.6尚筹网众筹平台将根据申请发起的项目类型不同，对发起人需要满足的其他资格进行限定和要求。</p>
					<h5>第6条  项目内容规范</h5>
					<p>6.1在尚筹网众筹平台上发起的项目应为具有创新性质且具有可执行性的项目，且项目目标须是明确、具体、可衡量的，如制作一个实物产品、拍一部微电影或完成一件艺术创作等。不得在无实质项目内容的情况下纯粹为公益组织发起募捐或以发起类似“资助奖学金”、“资助我去旅游”等为满足发起人个人需求之目的筹款。</p>
					<p>6.2项目内容须符合法律法规及尚筹网网站的相关规定；尚筹网众筹平台有权对项目提出特殊要求。不得抄袭、盗用他人的成果发起众筹项目，创意类产品必须为原创。</p>
					<p>6.3项目的内容必须包含“我想要做什么事情”、“项目风险”、“项目回报”、“为什么需要支持”等信息。同时，应向项目支持者充分说明项目存在的风险及挑战，以便于项目支持者对项目有全面充分的了解，从而独立慎重做出是否投资的决定。</p>
					<p>6.4项目内容及发起人上传的相关项目信息（包含但不限于文字、图片、视频等）须为发起人原创，如非发起人原创，则发起人应已获得权利人的相应授权，且权利人允许发起人转授权给尚筹网及尚筹网的关联公司在尚筹网网站及尚筹网关联公司的其他官方网站及线下媒体出于宣传尚筹网众筹平台的目的而进行永久的免费宣传、推广、使用。</p>
					<p>6.5项目不得含有攻击性、侮辱性言论，不得含有违反国家法律法规、政策的内容及其他尚筹网认为不适宜的内容。包括但不限于以下内容：</p>
					<p>6.5.1违反国家法律规定的违禁品，如毒品、枪支弹药及管制刀具相关；</p>
					<p>6.5.2非法、色情、淫秽、赌博、暴力、恐怖、反动、政治与宗教相关；</p>
					<p>6.5.3开办公司、网站、店铺等相关；</p>
					<p>6.5.4其他国家法律规定和尚筹网网站规定的禁限售等违禁品信息。</p>
					<p>6.6项目回报发放完成前不允许对已经完成生产的商品进行销售，公益相关项目除外。</p>
					<p>6.7 项目的排他性，项目在尚筹网众筹平台募集期内不得在其他任意平台同时发起类似项目或进行销售。一经发现，项目强行下架，并追究违约责任。</p>
					<p>6.8尚筹网众筹平台对项目的审核仅针对项目的合理性、项目内容与回报的匹配度等进行审核，发起人应保证发起的项目内容合法，且不侵犯他人合法权益。</p>
					<p>6.9在尚筹网众筹平台上发起项目时，应明确众筹开始时间和结束时间，以及项目众筹成功后的回报时间。截止项目结束时间，如项目众筹金额等于或大于预定众筹金额，则项目众筹成功；如项目众筹金额低于预定众筹金额，则项目众筹失败。</p>
					<h5>第7条  项目回报规范</h5>
					<p>7.1项目回报必须与项目具有关联性。回报应为项目进行过程中发起人产出的衍生成果或相关商品，公益相关项目除外。</p>
					<p>7.2 发起人承诺，如项目众筹成功，及时兑现对项目支持者承诺的回报；如项目众筹失败，同意尚筹网将众筹款项及时退还项目支持者，并由发起人就项目众筹失败的原因等对项目支持者做出解释。</p>
					<p>7.3项目回报产品在尚筹网众筹平台设置的最高单价应低于项目成功结束后<b>两个月内</b>的产品市场售价的<b>90%</b> ，否则应将售价差额发还支持者。</p>
					<p>7.4项目回报为实物的，产品量产后，应最先发放给尚筹网众筹平台支持该项目的支持者，否则将视为发起人违约，需承担违约责任及罚金。</p>
					<p>7.5如发起人与项目支持者在兑现回报过程中发生纠纷，一切责任由发起人承担，如因此给尚筹网造成经济或名誉损失，发起人应赔偿尚筹网相关损失。</p>
					<p>7.6如发起人在兑现对项目支持者的回报的过程中，与第三方（包括但不限于物流公司）发生纠纷，一切责任由发起人承担。</p>
					<h5>第8条  发起人行为规范</h5>
					<p>8.1项目审核通过后，发起人除可修改项目启动时间外，不得编辑、修改其他项目内容。</p>
					<p>8.2项目筹款成功前，发起人如因故需取消项目的，需向尚筹网众筹平台提交取消申请，尚筹网众筹平台审核通过后项目取消，所有筹集到的款项由尚筹网退回给支持者。</p>
					<p>8.3项目筹款成功后，发起人应严格按照项目计划执行，并在项目计划执行过程中积极与支持者互动。</p>
					<p>8.4项目筹款成功后，如项目因故延期或无法按原定项目计划执行的，或者因任何主观或客观因素导致项目最终无法完成的，发起人应第一时间通知尚筹网众筹平台，并及时通过尚筹网众筹平台及其他途径告知支持者，向支持者支付违约金，全额退还未履行订单的项目支持款。</p>
					<p>8.5发起人在项目募集期间，不能以任何形式在其他平台上发起该项目。如违反该规定，尚筹网有权对发起人追究责任。</p>
					<p>8.6发起人应按照承诺发放项目回报（项目衍生成果及/或相关商品），发放的项目回报应无质量或权利瑕疵，如因项目回报发生纠纷，参照国家相关法规处理(例如:《消费者权益保护法》)。</p>
					<p>8.7发起人在项目回报日前未完成回报，且无合理理由的，视为项目延期。<b>项目延期30天（含）以上的，视为项目失败</b>。尚筹网众筹平台有权通过系统直接向未确认收货的支持者退还支持款，发起人应当将支持款全额返还尚筹网众筹平台。</p>
					<p>8.8公益相关项目发起人应在完成项目后的合理时间内上传筹款项用于公益用途的相关凭证。</p>
					<p>8.9发起人应提交真实、准确的项目信息（项目信息如有任何更新，应及时向尚筹网众筹平台提交更新后的信息），并自主上传、提交项目。</p>
					<p>8.10发起人应自行承担准备或提交、完成项目而发生的费用，自行缴纳因从事本协议项下行为而产生的相应税款。</p>
					<p>8.11发起人应妥善保管尚筹网众筹平台的账号和密码，任何情况下发起人须对在该账号下发生的所有活动（包括但不限于信息披露、发布信息、上传图片或视频、网上点击同意或提交各类规则协议等）承担法律责任。</p>
					<p>8.12发起人了解并同意，不得自行或允许任何第三方使用发起人的账号通过尚筹网众筹平台从事任何违反法律法规或侵犯第三方权利的行为，包含但不限于：</p>
					<p>8.12.1侵犯任何第三方的专利、商标、著作权、商业秘密或其他合法权利，或违反任何法律或合同的；</p>
					<p>8.12.2发起人的行为或项目信息是虚假的、误导性的、不准确的；</p>
					<p>8.12.3发起人的行为或项目信息涉嫌非法、威胁、辱骂、骚扰、诽谤、中伤、欺骗、欺诈、侵权、淫秽、冒犯、亵渎或侵犯他人隐私的；</p>
					<p>8.12.4未经接收方允许而向接收方发布任何邮件、宣传材料或广告信息；</p>
					<p>8.12.5进行任何危害信息网络安全的行为，故意传播恶意程序或病毒以及其他破坏、干扰正常网络信息服务的行为。</p>
					<p>8.13对于发起人通过尚筹网众筹平台发布的涉嫌违法或涉嫌侵犯他人合法权利或违反本协议的信息，尚筹网有权依据尚筹网的判断不经通知发起人即予以修改、编辑、删除等。</p>
					<p>8.14实物回报类项目上线之前，发起人有义务主动提供样品进行评估审核，且项目一经上线无论众筹成功与否，样机不予退还。</p>
					<p>8.15发起人承诺不得未经尚筹网众筹平台同意擅自使用尚筹网众筹及其关联公司的任何知识产权。特别地，除非经尚筹网众筹平台书面批准，发起人在任何情形下都不在任何国家或地区将尚筹网众筹及其关联公司的商标及其类似商标、标识的全部或部分单独地或与其他任何商标、商号、文字或符号、域名合并使用或进行申请、注册等权力化行为。合作过程中，发起人应当在其知晓任何第三方可能侵犯尚筹网众筹平台知识产权时及时通知尚筹网众筹平台。</p>
					<p>8.16发起人违反上述行为规范对任何第三方造成损害的，发起人均应当以自己的名义独立承担所有的法律责任，并赔偿尚筹网因此产生的损失或费用，包括但不限于商誉损失等。</p>
					<h5>第9条  支持款交付及平台服务费</h5>
					<p>9.1尚筹网众筹平台对支持款的交付及平台服务费的收取均通过第三方支付平台<b>尚筹网易付宝</b>进行收付。</p>
					<p>9.2发起人使用尚筹网众筹平台服务，尚筹网将向发起人收取募集总金额3%的平台服务费，发起人与尚筹网另有约定的除外。</p>
					<p>9.3筹款成功后尚筹网众筹平台将在<b>3</b>个工作日内将募集总金额扣除平台服务费以及质量保证金（如有）后剩余款项的<b>60%</b>交付给发起人，并预留余下的<b>40%</b>作为确保项目成功并保证支持者获得回报的保证金(以下简称“保证金”)。在项目成功、无纠纷且所有支持者得到承诺回报的情况下，尚筹网将把这部分款项交付给发起人。发起人与尚筹网另有约定的除外。</p>
					<p>9.4根据市场与技术的发展，尚筹网保留变更保证金及平台服务费比例的权利。在变更前，尚筹网将以适当的方式通知发起人变更情况，包括但不限于在尚筹网网站上公示。发起人有权选择接受或拒绝接受，如果发起人选择拒绝的，应立即停止使用尚筹网众筹平台的服务；发起人继续使用尚筹网众筹平台的，即视为发起人同意尚筹网的费用变更。变更后的收费比例对已经发布的项目无溯及力。</p>
					<h5>第10条  知识产权</h5>
					<p>10.1发起人承诺，对于通过尚筹网众筹平台发布、上传的所有内容均拥有合法权利，不侵犯任何第三方的肖像权、隐私权、专利权、商标权、著作权等合法权利及其他合同权利。</p>
					<p>10.2发起人通过尚筹网众筹平台发布、上传的任何内容，发起人授予尚筹网及其关联公司非独家的、可转授权的、不可撤销的、全球通用的、永久的、免费的许可使用权利，并可对上述内容进行修改、改写、改编、发行、翻译、创造衍生性内容及/或可以将前述部分或全部内容加以传播、表演、展示，及/或可以将前述部分或全部内容放入任何现在已知和未来开发出的以任何形式、媒体或科技承载的作品当中。</p>
					<p>10.3尚筹网众筹平台向发起人提供的服务含有受到相关知识产权及其他法律保护的专有保密资料或信息，亦可能受到著作权、商标、专利等相关法律的保护。未经尚筹网或相关权利人书面授权，发起人不得修改、出售、传播部分或全部该等信息，或加以制作衍生服务或软件，或通过进行还原工程、反向组译及其他方式破译原代码。</p>
					<h5>第11条  纠纷处理</h5>
					<p>11.1虚拟类回报不支持退换货，也不支持退款，如有发货错误、漏发或支持者收到的虚拟类回报存在质量问题的，发起人应在七日内免费予以重发或补发。</p>
					<p>11.2实物类回报如有错发、漏发的，发起人应在七日内免费予以重发或补发，发起人无法重发或补发的，应退相应款项给支持者。</p>
					<p>11.3项目回报有质量问题的，参照国家相关法规处理(例如:《消费者权益保护法》)。</p>
					<p>11.4发起人怠于处理纠纷或处理纠纷不符合尚筹网相关规定的，尚筹网众筹平台有权利用预留的保证金/质保金处理支持者纠纷。如保证金不足以处理纠纷，发起人有义务向尚筹网支付处理纠纷所产生的费用。</p>
					<h5>第12条  违规处理</h5>
					<p>12.1对于违反本协议或尚筹网网站规则的发起人，尚筹网有权进行违规处理，涉及的罚款可以从保证金/质保金中扣除。</p>
					<p>12.2如发起人在筹款时间截止前非因不可抗力主动取消项目的，则发起人在一个月内不得再次发起项目。</p>
					<p>12.3如发起人在项目筹款成功后、发放回报前，非因不可抗力宣布项目失败或因项目延期而被认定为项目失败的，则发起人在三个月内不得再次发起项目，但如发起人已将支持者所支付的款项全额退回的，再次发起项目的时间可以不受限制。</p>
					<p>12.4尚筹网有权对发起人是否涉嫌违规做出单方认定，并根据单方认定结果中止、终止对发起人的平台使用许可或采取其他限制措施。</p>
					<p>12.5如发起人严重违反本协议、尚筹网网站规则或违反国家法律法规规定的，将被清退出尚筹网众筹平台，涉嫌犯罪的尚筹网将移送司法机关处理。</p>
					<h5>第13条  违约责任</h5>
					<p>13.1如发起人涉嫌违反有关法律或者本协议之约定，使尚筹网及/或尚筹网的关联公司遭受任何损失，或受到任何第三方的索赔，或受到任何行政管理部门的处罚，发起人应当赔偿尚筹网因此遭受的损失及/或发生的费用，包括合理的律师费用、调查取证费用等，相关费用尚筹网有权从保证金/质保金中扣除，不足部分，由发起人另行支付补足。</p>
					<p>13.2任何一方违反其于本协议项下的陈述、保证或承诺，而使另一方遭受任何诉讼、纠纷、索赔、处罚等的，违约方应负责解决，使另一方发生任何费用、额外责任或遭受经济损失的，应当负责赔偿。如一方发生违约行为，守约方可以书面通知方式要求违约方在指定的时限内停止违约行为，要求其消除影响。如违约方未能按时停止违约行为，则守约方有权立即终止本协议。如因尚筹网自身原因造成发起人的损失，尚筹网向发起人承担的最大总体责任和赔偿限额不应超过在本协议项下尚筹网已向发起人收取的服务费总额。</p>
					<p>13.3对于发起人应当承担的违约金，尚筹网有权从保证金/质保金中扣除，不予返还。</p>
					<h5>第14条  协议终止及争议解决</h5>
					<p>14.1在下列情况下，尚筹网可以随时无须承担任何义务和责任地全部或部分暂停、中止或终止履行本协议的义务或提供本协议项下的服务，直至解除本协议，且无须征得发起人的同意：</p>
					<p>14.1.1发起的项目违反尚筹网众筹平台使用规则或本协议约定条款；</p>
					<p>14.1.2发起人不同意接受本协议约定（含尚筹网发布的各类规则），且已停止使用尚筹网众筹平台针对项目发起人提供的服务；</p>
					<p>14.1.3发起人不符合本协议约定的项目发起人应具备的资格的；</p>
					<p>14.1.4发起的项目违反法律法规、监管政策或其他相关规定；</p>
					<p>14.1.5发起的项目将引发或可能引发尚筹网运营的重大风险；</p>
					<p>14.1.6发起的项目存在或可能存在明显危害支持者利益的风险；</p>
					<p>14.1.7因不可归责于尚筹网的原因造成项目无法继续进行或项目回报无法实现的。</p>
					<p>14.2因不可归责于尚筹网的原因造成协议终止，在协议终止前的行为所导致的任何赔偿和责任，发起人必须完全且独立地承担责任。</p>
					<p>14.3无论本协议因何种原因终止，并不影响本协议终止前已经筹款成功项目的效力，发起人均应将筹款成功的项目履行完毕，或依照约定或本协议的规定对支持者承担责任。</p>
					<p>14.4本协议及本协议项下的所有行为均适用中华人民共和国法律。</p>
					<p>14.5协议各方因本协议的签订、履行或解释发生争议的，各方应友好协商解决。如协商不成，任何一方均应向合同签订地法院（即：南京市玄武区人民法院）提起诉讼。</p>
					<p>14.6本协议的解释权归尚筹网众筹平台所有。</p>
					<p>
						<b>附件：</b>
					</p>
					<h5>《尚筹网众筹回报服务协议》</h5>
					<h5>（注：本协议只适用于尚筹网众筹平台发布的科技、设计类众筹）</h5>
					<p>鉴于：</p>
					<p>发起人在隶属于尚筹网（www.atcrowd.com）网站旗下尚筹网众筹平台（以下简称“尚筹网”）上发起项目筹款需求，并承诺给项目支持者提供回报。为保护支持者的合法权益，规范发起人的行为，维护众筹平台秩序，特拟定本协议。发起人承诺严格履行本协议约定，按照项目承诺为客户提供回报及相关服务。</p>
					<h5>1、 回报产品的退换服务</h5>
					<p>1.1发起人承诺自支持者收到回报产品的15天内提供无理由退换货服务，退换货过程中产生的快递费用，由发起人承担。如支持者选择退货的，发起人应于收到退回货物之日起3个工作日内为支持者全额退款。如支持者选择换货的，发起人应于收到更换货物之日起5个工作日内完成换货处理。</p>
					<p>1.2发起人承诺自支持者收到回报产品的第16天至1年内，提供免费维修或换新服务。如回报产品出现质量问题或因非人为原因无法正常使用，发起人应在收到支持者所更换货物之日起5个工作日内完成换货处理。货物更换过程中产生的快递费用，由发起人承担。</p>
					<p>1.3以下产品不适用于无理由退换货:</p>
					<p class="indent">1.3.1 个人定做类产品；</p>
					<p class="indent">1.3.2 文化类产品；</p>
					<p class="indent">1.3.3 在线下载或者已经拆封的音像制品，计算机软件等数字化商品；</p>
					<p class="indent">1.3.4 交付的报纸期刊类商品；</p>
					<p class="indent">1.3.5 未经授权的维修、误用、碰撞、疏忽、滥用、进液、事故、改动、不正确的安装所造成的产品质量问题，或撕毁、涂改标贴、机器序号、防伪标记；</p>
					<p class="indent">1.3.6其他根据产品性质不适宜退换货，或在众筹项目发起时已经明确表示不适用退换货的产品。</p>
					
					<p>1.4为保证产品在<strong><u>1年保修期</u></strong>内的售后服务质量，发起人须向尚筹网缴纳质量保证金（简称“质保金”），作为尚筹网处理客户投诉或产品质量问题用：
					</p><p> 若发起人为尚筹网（或尚筹网关联公司）已有合作方的，与已有合作业务关联，以尚筹网（或尚筹网关联公司）对发起人的应付账款作为质押，包括但不限于货款、保证金等。
					</p><p>若发起人非尚筹网（或尚筹网关联公司）已有合作方的，在项目筹款成功后，尚筹网从项目所筹得款项中自动扣取下述约定金额作为质量保证金，自所有支持者收到回报产品<strong><u> 1年</u></strong>以后，且发起人已经妥善处理所有客户投诉后，尚筹网将此质保金返还发起人，具体金额要求如下：</p>
					<table class="table-initiate">
						<tbody><tr>
							<th align="center"><strong>众筹项目分类 </strong></th>
							<th align="center"><strong>质保金 </strong></th>
							<th align="center"><strong>质保金上下限 </strong></th>
						</tr>
						<tr>
							<td>手机、电脑、数码、办公设备、网络设备、智能设备等 </td>
							<td rowspan="2">所筹金额×2.5%</td>
							<td rowspan="9">下限：1000元<br>
								上限：10万元<br>
								（即：最低收取1000元，最高收取10万元） </td>
						</tr>
						<tr>
							<td>孕婴用品、儿童用品（童装、童鞋、玩具）等 </td>
						</tr>
						<tr>
							<td>空调、电视、冰箱、洗衣机、影音产品等 </td>
							<td rowspan="4">所筹金额×2%</td>
						</tr>
						<tr>
							<td>厨卫大家电、厨房小家电、西式厨房电器、生活小家电、个人护理等 </td>
						</tr>
						<tr>
							<td>户外装备、体育器材、骑行装备、健身器材、垂钓用品、车载电器、汽车配件等 </td>
						</tr>
						<tr>
							<td>家纺、家具、灯具、建材、厨房卫浴用品、清洁用品、餐厨用具、生活日用、成人用品、宠物用品等 </td>
						</tr>
						<tr>
							<td>日化用品（美妆、护肤、洗护用品）等 </td>
							<td rowspan="3">所筹金额×1%</td>
						</tr>
						<tr>
							<td>图书、文化用品类 </td>
						</tr>
						<tr>
							<td>其它 </td>
						</tr>
					</tbody></table>
					<h5>2、 延迟回报（发货）补偿</h5>
					<p>众筹项目成功后，发起人应确保按照项目承诺及时为支持者提供回报。如出现回报延迟或未及时发货的情况，发起人应按照以下标准对支持者进行补偿。除项目失败造成的全额退款的情形外，其余情况的补偿金支付时间不得晚于支持者收到货物的时间。</p>
					<p>
						</p><table class="table-initiate">
							<tbody><tr>
								<th>延迟发货天数（单位：日）</th>
								<th>延迟交付违约金/其他处理措施</th>
							</tr>
							<tr>
								<td>X≤30</td>
								<td>违约金为：未履行订单总金额的5%</td>
							</tr>
							<tr>
								<td>X&gt;30</td>
								<td>项目失败，按照已履行订单总金额的5%支付违约金，并全额退还未履行订单的众筹款给支持者，未履行订单取消</td>
							</tr>
						</tbody></table>
					<p></p>
					<p>X为延迟发货天数，自承诺回报期限的最后一天的次日起算。如延迟天数达到30日，即视为发起人已经无法提供回报，项目失败，发起人应向所有支持者发表致歉声明或阐述说明，并在3日内完成未履行订单的退款。若发起人在延迟天数未满30天时，与支持者达成一致，并另行约定发货时间的除外。</p>
					<h5>3、 服务响应时效</h5>
					<p>在项目回报过程中，发起人应积极响应支持者、尚筹网或尚筹网众筹平台提出的各项问题和需求。对于提问邮件或各项需求邮件，应于2个工作日内回复处理意见或对申请进行处理。如发起人未按以上规定时间回复意见或进行相应处理，尚筹网或尚筹网众筹平台均有权从客户为先理念角度代发起人回复或处理，发起人应按照尚筹网或尚筹网众筹平台的处理意见为客户提供相关服务，因此造成的损失或产生的费用由发起人承担。</p>
					<h5>4、 违约责任</h5>
					<p>4.1如发起人涉嫌违反有关法律或者本协议之约定，使尚筹网或尚筹网众筹平台遭受任何损失包括但不限于，受到任何第三方的诉讼、纠纷、索赔，受到任何行政管理部门的处罚，发起人应当赔偿尚筹网或尚筹网众筹平台因此遭受的损失及/或发生的费用，包括合理的律师费用、调查取证费用等。</p>
					<p>4.2对于发起人应当承担的违约金，尚筹网或尚筹网众筹平台有权从发起人的保证金及质保金或其他由尚筹网或尚筹网众筹平台控制的款项中直接抵扣，不予返还。<b>保证金及质保金不足以支付的，尚筹网或尚筹网众筹平台均有权继续向发起人追偿。</b></p>
					<h5>5、 其他</h5>
					<p>5.1发起人同意遵守尚筹网网站（www.atcrowd.com）及其旗下任何网站已经发布的或将来可能发布的各类规则、操作流程。对违反约定或规定给客户造成损失的，发起人愿意接受尚筹网或尚筹网众筹平台的各项处罚。</p>
					<p>5.2凡因本协议引起的或与本协议有关的任何争议，由双方友好协商解决。协商不成时，任何一方均应向合同签订地法院（即：南京市玄武区人民法院）提起诉讼。</p>
				</div>
                        </div>
                        <div class="panel-footer" style="text-align:center;">
                            <button type="button" class="btn  btn-warning btn-lg" onclick="window.location.href='start-step-1.html'">阅读并同意协议</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        

        <div class="container" style="margin-top:20px;">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div id="footer">
                        <div class="footerNav">
                             <a rel="nofollow" href="http://www.layoutit.cn">关于我们</a> | <a rel="nofollow" href="http://www.layoutit.cn">服务条款</a> | <a rel="nofollow" href="http://www.layoutit.cn">免责声明</a> | <a rel="nofollow" href="http://www.layoutit.cn">网站地图</a> | <a rel="nofollow" href="http://www.layoutit.cn">联系我们</a>
                        </div>
                        <div class="copyRight">
                            Copyright ?2017-2017layoutit.cn 版权所有
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
      
    </div> <!-- /container -->
    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
    <script src="${APP_PATH }/script/back-to-top.js"></script>
	<script>
$('#myTab a').click(function (e) {
  e.preventDefault()
  $(this).tab('show')
})
	</script>
  </body>
</html>