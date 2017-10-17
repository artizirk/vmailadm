% rebase('base.tpl', title='Users')

<h2>Add</h2>
<form action="/users" method="POST">
  E-mail <input type="text" name="email" value="" placeholder="user@example.com">
  Password <input type="text" name="password" value="" placeholder="">
  <button name="action" value="add" type="submit">add</button>
</form>

<h2>Existing users</h2>
<table width=100%>
  <thead>
    <tr>
      <th>Id</th>
      <th>Email</th>
      <th>Active</th>
      <th>Action</th>
    </tr>
  </thead>
  <tbody>
% for user in users:
<tr>
  <form action="/users" method="POST">
    <input type="hidden" name="id" value="{{user[0]}}">
    <td style="text-align:center;"><a id="id{{user[0]}}">{{user[0]}}</a></td>
    <td><input type="text" name="email" value="{{user[1]}}"></td>
    <td><input type="checkbox" name="active" value="1" {{"checked" if user[2] else ""}}></td>
    <td>
      <button name="action" value="update" type="submit">Update</button>
      <button name="action" value="delete" type="submit">Delete</button>
    </td>
  </form>
</tr>
% end
</tbody>
% if len(users):
  <tfoot>
    <tr>
      <td colspan="4">Total nr of users: {{len(users)}}</td>
    </tr>
  </tfoot>
% else:
<tr>
  <td colspan="4" style="text-align:center;">No users</td>
</tr>
% end
</table>
