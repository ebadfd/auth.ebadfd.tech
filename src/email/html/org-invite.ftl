<#import "template.ftl" as layout>
<@layout.emailLayout>
<tr bgcolor="#ffffff">
   <td>
      <table bgcolor="#ffffff" style="width:100%;line-height:20px;padding:32px;border:1px solid;border-color:#f0f0f0"
         cellpadding="0">
         <tbody>
            <tr>
               <td style="color:#5e5e5e;line-height:22px;text-align: center;">
                  <div>
                     <#if firstName?? && lastName??>
                        ${kcSanitize(msg("orgInviteBodyPersonalizedHtml", link, linkExpiration, realmName, organization.name, linkExpirationFormatter(linkExpiration), firstName, lastName))?no_esc}
                     <#else>
                        ${kcSanitize(msg("orgInviteBodyHtml", link, linkExpiration, realmName, organization.name, linkExpirationFormatter(linkExpiration)))?no_esc}
                     </#if>
                  </div>
               </td>
            </tr>
         </tbody>
      </table>
   </td>
</tr>
</@layout.emailLayout>
