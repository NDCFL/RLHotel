package top.cflwork.util;

import com.alibaba.fastjson.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class  MsgInfo {
    public static final String UID = "絮落锦乡";
    public static final String KEY = "7dc6e6e7cf7ca510a6a4";
    public static final String REDIRECT_URL = "http://mykefang.com/logins";
    public static final String APP_ID = "wx3d80de020b39cdb4";
    public static final String APP_KEY = "baf9310251a3beaadfcd1b6541c7dd92";
    public static final String ACCESS_LOGIN_URL = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=" + APP_ID + "&redirect_uri=" + MsgInfo.encodeUrl(REDIRECT_URL) + "&response_type=code&scope=snsapi_userinfo&state=access#wechat_redirect";
    public static final String GET_ACCESS_TOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + APP_ID + "&secret=" + APP_KEY + "&code={CODE}&grant_type=authorization_code";
    public static final String GET_USER_INFO = "https://api.weixin.qq.com/sns/userinfo?access_token={ACCESS_TOKEN}&openid={OPENID}&lang=zh_CN";
    /**
     * 微信授权登录
     *
     * @param code
     * @return
     */
    public String authLogin(String code) {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        // 微信授权登录API
        HttpGet httpGet = new HttpGet(MsgInfo.GET_ACCESS_TOKEN_URL.replace("{CODE}", code));
        String accessor = null;
        try {
            accessor = httpclient.execute(httpGet, responseHandler);
            httpclient.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return accessor;
    }

    /**
     * 获取微信用户信息
     *
     * @param accessToken
     * @param
     * @return
     */
    public String getEmpAllInfo(String accessToken, String user_ticket) throws Exception {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(MsgInfo.GET_USER_INFO.replace("{ACCESS_TOKEN}", accessToken));
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("user_ticket", user_ticket);
        ByteArrayEntity entity = new ByteArrayEntity(jsonObject.toString().getBytes("UTF-8"));
        entity.setContentType(new BasicHeader(HTTP.CONTENT_TYPE, "application/json"));
        httpPost.setEntity(entity);
        String result = httpclient.execute(httpPost, responseHandler);
        return result;
    }

    /**
     * @param accessToken
     * @param userid
     * @return
     * @throws Exception
     */
    public String getOpenId(String accessToken, String userid) throws Exception {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(MsgInfo.GET_USER_INFO.replace("{ACCESS_TOKEN}", accessToken));
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("userid", userid);
        ByteArrayEntity entity = new ByteArrayEntity(jsonObject.toString().getBytes("UTF-8"));
        entity.setContentType(new BasicHeader(HTTP.CONTENT_TYPE, "application/json"));
        httpPost.setEntity(entity);
        String result = httpclient.execute(httpPost, responseHandler);
        return result;
    }

    /**
     *
     */
    public String getUserInfo(String accessToken, String openid) {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(MsgInfo.GET_USER_INFO.replace("{ACCESS_TOKEN}", accessToken).replace("{OPENID}", openid));
        String userInfo = null;
        try {
            userInfo = httpclient.execute(httpGet, responseHandler);
            httpclient.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return userInfo;
    }
    private ResponseHandler<String> responseHandler = new ResponseHandler<String>() {

        public String handleResponse(final HttpResponse response) throws IOException {
            int status = response.getStatusLine().getStatusCode();
            if (status >= 200 && status < 300) {
                HttpEntity entity = response.getEntity();
                return entity != null ? EntityUtils.toString(entity) : null;
            } else {
                throw new ClientProtocolException("Unexpected response status: " + status);
            }
        }

    };
    public static String getReqMethod(HttpServletRequest req) {
        String uri = req.getRequestURI();
        return req.getRequestURI().substring(uri.lastIndexOf("/") + 1);
    }

    public static String getRootPath(HttpServletRequest request) {
        return request.getServletContext().getRealPath("/");
    }

    public static String encodeUrl(String url) {
        try {
            return URLEncoder.encode(url, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
