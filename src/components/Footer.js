import { ContactPhoneOutlined, EmailOutlined } from "@material-ui/icons";
import React from "react";

const Footer = () => {
  return (
    <div className="footer">
      <div className="footer-flex">
        <ContactPhoneOutlined className="icon" />
        <a href="tel:09054416766" id="contact">CONTACT ME</a>
      </div>
      <div className="footer-flex">
        <EmailOutlined className="icon" />
        <a href="mailto:davidabu80@gmail.com">EMAIL</a>
      </div>
    </div>
  );
};

export default Footer;
