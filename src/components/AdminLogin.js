import React from "react";
import { Button, Input } from "antd";
import Link from "next/link";
import UserWebLayout from "./UserWebLayout";


const AdminLogin = () => {
  return (
    <UserWebLayout webtitle="Admin Login">
      <div className="admin-login">
        <div className="flex flex-col mt-32 h-[350px] rounded-sm bg-white mx-[500px] items-center justify-center">
          <h2 className="text-3xl pb-8">ADMIN LOGIN</h2>
          <div>
            <div>
              <label className="text-lg text-black font-bold">
                Email Address
              </label>
              <br></br>
              <Input
                type="text"
                placeholder="Enter EmailAddress"
                required
              />
            </div>
          </div>
          <div>
            <div>
              <label className="text-lg text-black font-bold">
                Enter Password Code
              </label>
              <br></br>
              <Input
                type="password"
                placeholder="Enter Password Code"
                required
              />
            </div>
          </div>

          <br></br>
          <div>
            <Link href="/dashboard">
              <div>
                <Button
                  className="bg-orange-500 text-black w-[200px] font-bold hover:bg-gray-500 "
                  htmlType="submit"
                >
                  LOGIN
                </Button>
              </div>
            </Link>
          </div>
        </div>
      </div>
    </UserWebLayout>
  );
};

export default AdminLogin;
