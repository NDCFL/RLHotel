package top.zywork.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import top.zywork.common.Message;
import top.zywork.query.StatusQuery;
import top.zywork.service.ContractMasterService;
import top.zywork.service.VerifcodeService;
import top.zywork.vo.Verifcode;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Random;

@Controller
@RequestMapping("code")
public class VerifcodeController {

    @Resource
    private VerifcodeService verifcodeService;
    @Resource
    private ContractMasterService contractMasterService;
    /**
     * 发送手机短信验证码
     * @param verifcode
     * @return
     */
    @RequestMapping("sendCode")
    @ResponseBody
    public Message addCode(Verifcode verifcode){
        try{
            //查询改手机号在有效期5分钟之内是否还有未使用的短信，如果有则返回code如果没有则返回-1
            String dbCode = verifcodeService.queryByCode(verifcode.getMobile());
            if(dbCode==null || dbCode.equals("")){
                //生成6位数的验证码
                int code = new Random().nextInt(888888)+100000;
                //执行注册发送的验证码
                if(verifcode.getCodeType().equals("register")){
                    //保存到数据库中并且发送到手机上
                    verifcode.setCode(code+"");
                    verifcode.setMsg("【瑞蓝酒店】注册验证码，你的验证码是："+code);
                    System.out.println(code+"====注册发送的验证码==>>>");
                }else if(verifcode.getCodeType().equals("findPwd")){
                    int cnt = contractMasterService.checkPhone(verifcode.getMobile());
                    if(cnt==0){
                        return  Message.fail("账号不存在!");
                    }else{
                        //保存到数据库中并且发送到手机上
                        verifcode.setCode(code+"");
                        verifcode.setMsg("【瑞蓝酒店】找回密码，你的验证码是："+code);
                        System.out.println(code+"====找回密码注册发送的验证码==>>>");
                    }
                }
                verifcodeService.save(verifcode);
            }else{
                //发送数据库原来就有的验证码dbcode
                //模拟接收验证码
                System.out.println(dbCode+"====来自于数据库的验证码====>>>");
            }
            return  Message.success("验证码发送成功!");
        }catch (Exception e){
            e.printStackTrace();
            return  Message.success("验证码发送失败!");
        }
    }

    /**
     * 验证手机验证码是否输入正确
     * @param verifcode
     * @return
     *
     */
    @RequestMapping("validateCode")
    @ResponseBody
    public Message validateCode(Verifcode verifcode){
        try{
            //查询改手机号在有效期5分钟之内是否还有未使用的短信，如果有则返回code如果没有则返回-1
            String dbCode = verifcodeService.queryByCode(verifcode.getMobile());
            System.out.println(verifcode.getCode()+"==========>>>");
            if(!dbCode.equals(verifcode.getCode())){
                return  Message.fail("验证码输入错误!");
            }else{
                System.out.println("==================");
                verifcodeService.updateCodeStatus(new StatusQuery(1,verifcode.getMobile()));
                return  Message.success("验证码输入正确!");
            }
        }catch (Exception e){
            e.printStackTrace();
            return  Message.success("验证码已失效!");
        }
    }
    @RequestMapping("updateCodeStatus")
    @ResponseBody
    public Message updateCodeStatus(Verifcode verifcode){
        try{
            //状态为1代表使用过的或者已经作废的，0代表的是未使用过
            verifcodeService.updateCodeStatus(new StatusQuery(1,verifcode.getMobile()));
            return  Message.success("验证码校验成功!");
        }catch (Exception e){
            e.printStackTrace();
            return  Message.success("验证码校验失败!");
        }
    }
}
