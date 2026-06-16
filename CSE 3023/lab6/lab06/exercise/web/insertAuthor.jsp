<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert Author</title>
    </head>
    <body>

        <h1>Lab 6 - Task 2 - Perform creating and retrieving records via JSP page</h1>

        <form action="processAuthor.jsp" method="post">

            <table>
                <tr>
                    <td>Author No</td>
                    <td>
                        <input type="text" name="authno" required>
                    </td>
                </tr>

                <tr>
                    <td>Name</td>
                    <td>
                        <input type="text" name="name" required>
                    </td>
                </tr>

                <tr>
                    <td>Address</td>
                    <td>
                        <input type="text" name="address" required>
                    </td>
                </tr>

                <tr>
                    <td>City</td>
                    <td>
                        <input type="text" name="city" required>
                    </td>
                </tr>

                <tr>
                    <td>State</td>
                    <td>
                        <input type="text" name="state" required>
                    </td>
                </tr>

                <tr>
                    <td>Zip</td>
                    <td>
                        <input type="text" name="zip" required>
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
</html>F