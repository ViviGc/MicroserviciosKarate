function fn(){

    var config = {
        baseURL : 'https://internal-AWS-PRB-ALB-BACK-398488634.us-east-1.elb.amazonaws.com/v1/transversal/administrative/customerTypes',
        baseurl : 'https://api-patients-dev.fundacionsantafedebogota.com',
        timestamp : Math.round(new Date().getTime() / 1000)
    };
    karate.configure('connectTimeout', 30000);
    karate.configure('readTimeout', 30000);
    return config;
}
