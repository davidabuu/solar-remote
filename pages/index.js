import Header from "../src/components/Header";
import UserWebLayout from "../src/components/UserWebLayout";
import { Button } from "antd";
import Solution from "../src/components/Solution";
import Footer from "../src/components/Footer";
import Aos from "aos";
import { useEffect } from "react";
import "aos/dist/aos.css";
import Link from "next/link";

export default function Home() {
  useEffect(() => {
    Aos.init();
  }, []);
  return (
    <UserWebLayout webtitle="Solar Plant">
      <div className="container-landing">
        <div className="img-overlay">
          <Header />
          <div data-aos="fade-right" className="intro-container">
            <h1>Monitoring of Solar Power Plant</h1>
            <div className="btn">
              <Link href='/login'>
                <Button className="btn">LOGIN</Button>
              </Link>
            </div>
          </div>
        </div>
      </div>
      <Solution />
      <Footer />
    </UserWebLayout>
  );
}
