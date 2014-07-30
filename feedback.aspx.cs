using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DHSDataSetTableAdapters;
using System.Net.Mail;

public partial class feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, System.EventArgs e)
    {
        var msgText = "";

        var smtp = new SmtpClient
        {
            Host = "smtp.gmail.com",
            Port = 587,
            EnableSsl = true,
            DeliveryMethod = SmtpDeliveryMethod.Network,
            UseDefaultCredentials = false,
            Timeout = 20000,
            Credentials = new System.Net.NetworkCredential("aecamrg@gmail.com", "123aecamrg")
        };

        System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();

        msg.IsBodyHtml = true;
        msg.Bcc.Add("jojoseph@ualr.edu");
        msg.Bcc.Add("ilfarmahan@ualr.edu");
        msg.Bcc.Add("drrasmussen@ualr.edu");
        msg.To.Add("aecamrg@gmail.com");
        msg.CC.Add(p1f4c.Text);

        msg.From = new System.Net.Mail.MailAddress(p1f4c.Text);

        msg.Subject = "AECAM Feedback Form from: " + p1f2c.Text + " " + p1f3c.Text;


        msgText = "<table cellpadding='5px'>";
        msgText = msgText + "<tr><td width='30%'>Name:</td><td>" + p1f2c.Text + " " + p1f3c.Text + "</td></tr>";
        msgText = msgText + "<tr><td>Email:</td><td>" + p1f4c.Text + "</td></tr>";
        msgText = msgText + "<tr><td>Phone:</td><td>" + p1f5c.Text + "</td></tr>";
        msgText = msgText + "<tr><td>Please provide your feedback on the quality of this online directory and mapping system:</td><td>" + rblist0.SelectedValue + "</td></tr>";
        msgText = msgText + "<tr><td>This feedback is specific to this site's...</td><td>" + rblist2.SelectedValue + "</td></tr>";
        if (rblist2.SelectedValue == "Other")
        {
            msgText = msgText + "<tr><td>Other:</td><td>" + p1f7c_4_other.Text + "</td></tr>";
        }
        msgText = msgText + "<tr><td>Were you able to find what you were looking for?</td><td>" + rblist4.SelectedValue + "</td></tr>";
        msgText = msgText + "<tr><td>Directory Listing data to add to our site (please be detailed):</td><td>" + p1f10c.Value + "</td></tr>";
        msgText = msgText + "<tr><td>Please tell us which section this new information belongs to:</td><td>" + rblist3.SelectedValue + "</td></tr>";
        msgText = msgText + "<tr><td>Is this listing brand new or is this an update to an existing listing?</td><td>" + rblist1.SelectedValue + "</td></tr>";
        msgText = msgText + "<tr><td>How could we make the site easier to use?</td><td>" + p1f14c.Value + "</td></tr>";
        msgText = msgText + "<tr><td>Do you have any other suggestions on what we can do to provide you with a better service?</td><td>" + p1f15c.Value + "</td></tr>";
        msgText = msgText + "</table>";
        msg.Body = msgText;
        //lblStatus.Text = "Sending...";



        smtp.Send(msg);

        Response.Redirect("success.aspx");
        //lblStatus.Text = "Sent email (" + txtSubject.Text + ") to " +txtTo.Text;                                         

    }
}