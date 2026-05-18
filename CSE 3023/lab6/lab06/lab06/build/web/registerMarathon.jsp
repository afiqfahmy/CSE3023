<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Marathon Registration</title>
    </head>
    <body>

        <h1>Marathon Registration</h1>

        <form action="processMarathon.jsp" method="post">
            <table>
                <tr>
                    <td>IC No</td>
                    <td><input type="text" name="icno" placeholder="e.g. 890710-11-2369" required></td>
                </tr>

                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" required></td>
                </tr>

                <tr>
                    <td>Category</td>
                    <td>
                        <select name="category" required>
                            <option value="5 KM">5 KM</option>
                            <option value="7 KM">7 KM</option>
                            <option value="10 KM">10 KM</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Submit">
                        <input type="reset" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>

    </body>
</html>