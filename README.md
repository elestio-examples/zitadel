# Zitadel CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/zitadel"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy Zitadel server with CI/CD on Elestio

<img src="Zitadel.png" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can open Zitadel UI here:

    URL: https://[CI_CD_DOMAIN]
    email: root@zitadel.[CI_CD_DOMAIN]
    password: [ADMIN_PASSWORD]


GRPC API is available over:
    
    [CI_CD_DOMAIN]:8443

example GRPC query:
    
     docker run fullstorydev/grpcurl [CI_CD_DOMAIN]:8443 list
    
You can access PgAdmin by:
    
    URL: [CI_CD_DOMAIN]:23456
    email: [ADMIN_EMAIL]
    password: [ADMIN_PASSWORD]