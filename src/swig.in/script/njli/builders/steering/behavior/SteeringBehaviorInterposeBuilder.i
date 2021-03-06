//Factory
%newobject njli::SteeringBehaviorInterposeBuilder::create;
%delobject njli::SteeringBehaviorInterposeBuilder::destroy;
%factory(njli::SteeringBehaviorInterposeBuilder *njli::SteeringBehaviorInterposeBuilder::create, njli::SteeringBehaviorInterposeBuilder /*Add the children to the njli::SteeringBehaviorInterposeBuilder class*/);
%factory(njli::SteeringBehaviorInterposeBuilder *njli::SteeringBehaviorInterposeBuilder::clone, njli::SteeringBehaviorInterposeBuilder /*Add the children to the njli::SteeringBehaviorInterposeBuilder class*/);
%factory(njli::SteeringBehaviorInterposeBuilder *njli::SteeringBehaviorInterposeBuilder::copy, njli::SteeringBehaviorInterposeBuilder /*Add the children to the njli::SteeringBehaviorInterposeBuilder class*/);

//Extend
%extend njli::SteeringBehaviorInterposeBuilder
{
    const char *__concat__(const char *s) {
        static std::string temp;
        std::string t1(*self);
        std::string t2(s);
        
        temp = (t1 + t2);
        return temp.c_str();
    }
    
    const char *__str__()
    {
            std::string s(*self);
            static char tmp[1024];
            sprintf(tmp, "%s", s.c_str());
            return tmp;
    }
}
