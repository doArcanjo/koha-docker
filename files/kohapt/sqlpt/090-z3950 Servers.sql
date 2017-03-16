
INSERT INTO `z3950servers` 
(`id`,`host`,`port`,`db`,`userid`,`password`,`servername`,`checked`,`rank`,`syntax`,`timeout`,`servertype`,`encoding`,`recordtype`,`sru_options`,`sru_fields`,`add_xslt`) 
VALUES 
(1,'porbase.bnportugal.pt',210,'porbase','','','BIBLIOTECA NACIONAL',1,0,'UNIMARC',0,'zed','ISO_5426','biblio','','','')
on duplicate key update id=values(id), host=values(host), port=values(port), db=values(db), userid=values(userid), password=values(password), servername=values(servername), checked=values(checked), rank=values(rank), syntax=values(syntax), timeout=values(timeout), servertype=values(servertype), encoding=values(encoding), recordtype=values(recordtype), sru_options=values(sru_options), sru_fields=values(sru_fields), add_xslt=values(add_xslt);