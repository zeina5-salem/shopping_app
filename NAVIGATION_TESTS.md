# Shopping App – Navigation Tests

## Test 1: push() and pop()

**Steps:**
- Login to Signup using `context.push("/signup")`.
- Signup back using `context.pop()`.

**Result:**

Signup opened on top of Login. When `context.pop()` was called, Signup closed and the app returned to Login. Login remained in the navigation stack and was not disposed.

## Test 2: go() and pop()

**Steps:**
- Login to Signup using `context.go("/signup")`.
- Signup back using `context.pop()`.

**Result:**

Login was disposed when navigating to Signup using `go()`. When `context.pop()` was called, the following error appeared:

`GoError: There is nothing to pop`

This happened because there was no previous page available in the navigation stack.

## Test 3: go() and go()

**Steps:**
- Login to Signup using `context.go("/signup")`.
- Signup back using `context.go("/login")`.

**Result:**

Signup opened and Login was disposed. When `context.go("/login")` was called, Signup closed and Login was created again.

## Test 4: push() and Back Arrow

**Steps:**
- Login to Signup using `context.push("/signup")`.
- Go back using the browser back button.

**Result:**

Signup closed and the app returned to Login. Login remained in the navigation stack and was not disposed.

## initState() and dispose() observations

- With `push()`, Login is not disposed when Signup opens.
- With `go()`, Login is disposed when navigating to Signup.

## Test 5.4: Find the Hidden Bug

**What happened?**

Login navigated to Home using `context.go("/home")`. When the Home back button called `context.pop()`, a `GoError: There is nothing to pop` error appeared because there was no previous route available to pop back to.

**Fix:**

The button was changed to Logout:

```dart
Database.isLoggedIn = false;
context.go("/login");
```

This resets the login status and navigates directly to Login.
