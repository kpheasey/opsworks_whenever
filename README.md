# opsworks_whenever

Manage crontab with [whenever](https://github.com/javan/whenever) on AWS OpsWorks.  

This recipe was built with [opsworks_ruby](https://github.com/ajgon/opsworks_ruby) in mind.  However, it is not a 
dependency.

## Usage

Include this cookbook in your stack's custom chef cookbooks.

Add `opsworks_whenever` as one of the last recipes on your layer's deploy step.  It should come after the main 
application deployment, to ensure the latest schedule is used.

Include the default whenenver role in your application's custom JSON.

```json
{
  "deploy": {
    "my_app": {
      "whenever": {
          "roles": ["default"]
      }
    }
  }
}
```

## Options

If you have the whenever schedule configured using roles, you can can specify those in the `roles` option.

The `"default"` role specifies all scheduled tasks without a role.
