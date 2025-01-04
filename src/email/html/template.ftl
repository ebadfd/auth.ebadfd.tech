<#macro emailLayout>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
    <div style="background-color:#181b23;margin:0">
        <table
            style="font-family:'proxima nova' , 'century gothic' , 'arial' , 'verdana' , sans-serif;font-size:14px;color:#5e5e5e;width:98%;max-width:600px;float:none;margin:0 auto"
            border="0" cellpadding="0" cellspacing="0" valign="top" align="left">
            <tbody>
                <tr align="middle">
                    <td style="padding-top:30px;padding-bottom:32px"><img
                            src="https://ebadfd.tech/static/favicon/favicon.svg" height="37" /></td>
                </tr>

                <#nested>

                <tr>
                    <td>
                        <table style="width:100%;line-height:20px;padding:32px" cellpadding="0">
                            <tbody>
                                <tr>
                                    <td style="font-size:12px;padding-top:24px;color:#999">This email was
                                        automatically sent by using <a href="https://auth.ebadfd.tech/"
                                            style="color:#616161">ebadfd services.</td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
</body>
</html>
</#macro>
