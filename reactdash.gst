import React, { useState } from "react";
import { Card, CardContent } from "@/components/ui/card";
import { BarChart, LineChart, PieChart, Map } from "@/components/ui/charts";
import { Button } from "@/components/ui/button";
import { Select, SelectItem } from "@/components/ui/select";

const Dashboard = () => {
  const [dateRange, setDateRange] = useState({ from: "2024-06-03", to: "2024-06-03" });
  const [selectedMonth, setSelectedMonth] = useState("July");

  return (
    <div className="p-6">
      <header className="flex justify-between items-center mb-6">
        <h1 className="text-2xl font-bold">Welcome Back, B!</h1>
        <div className="flex space-x-4">
          <label>Date Range:</label>
          <input type="date" value={dateRange.from} onChange={(e) => setDateRange({ ...dateRange, from: e.target.value })} />
          <input type="date" value={dateRange.to} onChange={(e) => setDateRange({ ...dateRange, to: e.target.value })} />
        </div>
      </header>

      <div className="grid grid-cols-4 gap-4 mb-6">
        <Card><CardContent>Total Customers: 1500</CardContent></Card>
        <Card><CardContent>Active Customers: 1200</CardContent></Card>
        <Card><CardContent>Satisfaction Rate: 85%</CardContent></Card>
        <Card><CardContent>New Customers: 50</CardContent></Card>
      </div>

      <div className="mb-6">
        <h2 className="text-xl font-bold mb-2">Market Assessment</h2>
        <Select value={selectedMonth} onChange={setSelectedMonth}>
          <SelectItem value="July">July</SelectItem>
          <SelectItem value="August">August</SelectItem>
        </Select>
        <BarChart data={[{ category: "Potential New Clients", value: 15 }, { category: "Existing Clients", value: 20 }]} />
      </div>

      <div className="grid grid-cols-2 gap-4 mb-6">
        <Card>
          <CardContent>
            <h2 className="text-xl font-bold">Conversion Rate</h2>
            <LineChart data={[{ month: "Jan", enquiries: 300, conversions: 100 }]} />
          </CardContent>
        </Card>
        <Card>
          <CardContent>
            <h2 className="text-xl font-bold">Customer Growth Rate</h2>
            <LineChart data={[{ month: "Jan", new: 400, churned: 100 }]} />
          </CardContent>
        </Card>
      </div>

      <div className="grid grid-cols-2 gap-4 mb-6">
        <Card>
          <CardContent>
            <h2 className="text-xl font-bold">Top 10 Customers</h2>
            <table className="w-full border-collapse">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Address</th>
                  <th>Satisfaction</th>
                  <th>Revenue</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>John Doe</td>
                  <td>Lagos, Nigeria</td>
                  <td>90%</td>
                  <td>N200,000</td>
                </tr>
              </tbody>
            </table>
          </CardContent>
        </Card>
        <Card>
          <CardContent>
            <h2 className="text-xl font-bold">Customer Satisfaction Rate</h2>
            <PieChart data={[{ label: "Satisfied", value: 70 }, { label: "Unsatisfied", value: 20 }, { label: "Others", value: 10 }]} />
          </CardContent>
        </Card>
      </div>

      <Card>
        <CardContent>
          <h2 className="text-xl font-bold">Customer Region Map</h2>
          <Map markers={[{ region: "Yaba", customers: 50000, sales: 700000 }]} />
        </CardContent>
      </Card>
    </div>
  );
};

export default Dashboard;
