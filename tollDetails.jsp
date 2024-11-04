<!DOCTYPE html>
<html>
<head>
    <title>Toll Collection Details</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 50px;
            margin: 0;
            background-color: #f0f2f5;
        }

        /* Container styling */
        .container {
            width: 90%;
            max-width: 800px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
        }

        /* Title styling */
        h1 {
            color: #333;
            font-size: 24px;
            text-align: center;
            margin: 0;
            padding-bottom: 10px;
            border-bottom: 2px solid #4CAF50;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
        }

        td {
            background-color: #fff;
            color: #333;
            border-bottom: 1px solid #ddd;
        }

        /* Alternating row colors */
        tr:nth-child(even) td {
            background-color: #f9f9f9;
        }

        /* Hover effect for table rows */
        tr:hover td {
            background-color: #e0f7e0;
            transition: background-color 0.3s ease;
        }

        /* Centering and styling loading text */
        .loading-text {
            text-align: center;
            color: #777;
            font-style: italic;
        }

        /* Media query for responsive design */
        @media (max-width: 600px) {
            .container {
                padding: 15px;
            }

            h1 {
                font-size: 20px;
            }

            th, td {
                padding: 10px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Toll Collection Details</h1>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Total Vehicles</th>
                    <th>Total Amount</th>
                </tr>
            </thead>
            <tbody id="tollData">
                <tr>
                    <td colspan="3" class="loading-text">Loading data...</td>
                </tr>
            </tbody>
        </table>
    </div>

    <script>
        // Fetch data from TollDetailsServlet and display it in the table
        fetch('TollDetailsServlet')
            .then(response => response.text())
            .then(data => document.getElementById('tollData').innerHTML = data)
            .catch(error => console.error('Error fetching toll details:', error));
    </script>
</body>
</html>
